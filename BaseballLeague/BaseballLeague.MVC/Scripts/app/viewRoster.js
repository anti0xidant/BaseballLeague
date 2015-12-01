$(document).ready(function () {

    // Creates TeamID variable which is used by many functions
    var TeamID = $('#currentTeamID').val();

    // Initial load of team roster
    loadRoster(TeamID);

    // Loads team list dropdown in Trade Player Modal
    populateDropdownForTradeModal();

    // Show Sign Free Agent Modal and AJAX call to populate the Free Agents List
    $('#btnShowSignFreeAgent').click(function () {
        $('#signFreeAgentModal').modal('show');

        $.ajax({
            url: '/api/TeamAPI/GetFreeAgents',
            type: 'GET',
            success: function(data, status, xhr) {
                $('#freeAgentModalTBody').empty();

                $.each(data, function(index, player) {
                    $(createTableDataFreeAgents(player)).appendTo($('#freeAgentModalTBody'));
                });
            }
        });
    });

    /* Used .on() instead of .click() because .on() also adds event handlers to future elements 
       whereas .click() only adds to elements that exist during initial load.
       The 'Sign' button of SignFreeAgent modal do not exist until the modal is displayed,
       therefore, .on() is the appropriate choice. .on() is a combination of .live() and .bind(). */
    $(document).on("click", ".btnSignFreeAgent", function() {

        var PlayerID = $(this).val();

        $.ajax({
            url: '/api/TeamAPI/SignFreeAgent?TeamID=' + TeamID + '&PlayerID=' + PlayerID,
            type: 'PUT',
            success: function (data, status, xhr) {
                $('#signFreeAgentModal').modal('hide');
                loadRoster(TeamID);
            },
            error: function (xhr, status, err) {
                alert('error:' + err);
            }
        });

    });
    
    /* Adds click event to Submit Trade button of Trade Player Modal. This event 
       grabs PlayerID from the Modal's hidden input and the new team's TeamID from
       the Team Selector dropdown list. The event finally submits this data to server 
       using AJAX PUT call */
    $('#btnMakeTrade').click(function () {
        
        var PlayerID = $('#tradePlayerID').val();
        var NewTeamID = $('#tradeTeamID').val();

        $.ajax({
            url: '/api/TeamAPI/TradePlayerToAnotherTeam?PlayerID=' + PlayerID + '&TeamID=' + NewTeamID,
            type: 'PUT',
            success: function(data, status, xhr) {
                $('#tradePlayerModal').modal('hide');
                loadRoster(TeamID);
            },
            error: function(xhr, status, err) {
                getCompositionAlternatives('error:' + err);
            }
        });
    });

    /* This function grabs PlayerID from Release Player Modal's hidden input and releases
       player as Free Agent via AJAX. After, the modal is re-hidden and the roster is re-built. */
    $('#btnRelease').click(function () {
        var PlayerID = $('#releasePlayerID').val();
        
        $.ajax({
            url: '/api/TeamAPI/ReleasePlayer?PlayerID=' + PlayerID,
            type: 'PUT',
            success: function (data, status, xhr) {
                $('#releasePlayerModal').modal('hide');
                loadRoster(TeamID);
            },
            error: function (xhr, status, err) {
                alert('error:' + err);
            }
        });
    });

    /* Adds click event to Trade button which launches Trade Player Modal and stores
       PlayerID as a hidden input in the Trade Player Modal. This click event is added whenever 
       a new button is created  */
    $('#table').on('click', '.btnTradePlayer', function () {
        $('#tradePlayerID').val($(this).val());
        $('#myModalLabel').html('Trade Player - ' + $(this).closest("tr").children("td").eq(1).html());
        $('#tradePlayerModal').modal('show');
        
    });

    /* Adds click event to Release button which launches the Release Player Modal and stores
       PlayerID as a hidden input in the Release Player Modal. This click event is added whenever
       a new button is created */
    $('#table').on('click', '.btnReleasePlayer', function () {
        $('#playerNameRelease').html("Are you sure you want to release " + $(this).closest("tr").children("td").eq(1).html() + " (" + $(this).closest("tr").children("td").eq(4).html().toLowerCase() + ")?");
        $('#releasePlayerID').val($(this).val());
        $('#releasePlayerModal').modal('show');
    });

});

/* Uses the TeamID from the Team Index page to make an AJAX call to retrieve complete roster from API.
   Upon success, the roster table is FIRST cleared, THEN repopulated with data from the AJAX call. */
function loadRoster(TeamID) {
    $.ajax({
        url: '/api/TeamAPI/GetFullRoster?TeamID=' + TeamID,
        type: 'GET',
        success: function(data, status, xhr) {
            $('#teamRoster').empty();

            $.each(data, function(index, player) {
                $(createTableDataPlayer(player, index)).appendTo($('#teamRoster'));
            });
        }
    });
};

// Populates team dropdown in Trade Player Modal. Skips option for Free Agent
function populateDropdownForTradeModal() {
    $.ajax({
        url: '/api/TeamAPI/GetTeamsDropDown',
        type: 'GET',
        success: function(data, status, xhr) {
            $.each(data, function(index, team) {
                if (team.TeamName != 'Free Agent') {
                    $(createTeamsDropdownForTradeModal(team)).appendTo($('#tradeTeamID'));
                }
            });
        }
    });
}

// Creates HTML table row of player data which is used to populate Roster Table in loadRoster()
function createTableDataPlayer(player, count) {
    var secondPosition = '-';

    if (player.SecondaryPosition) {
        secondPosition = player.SecondaryPosition;
    }
    return '<tr><td>' + (count + 1) + '</td><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.LastYearBA + '</td><td>' + player.PrimaryPosition + '</td><td>' + secondPosition + '</td><td>' + player.YearsPlayed + '</td><td><button class=\"btn btn-primary btn-xs btnTradePlayer\" value=\"' + player.PlayerID + '\">Trade</button></td>' +
        '<td><button class=\"btn btn-danger btn-xs btnReleasePlayer\" value=\"' + player.PlayerID + '\">Release</button></td></tr>';
}

// Creates HTML table row of Free Agent data which is used to populate Free Agent Table when modal is launched
function createTableDataFreeAgents(player) {
    return '<tr><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.LastYearBA + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td><td>' + player.YearsPlayed + '</td><td><button class=\"btn btn-success btn-xs btnSignFreeAgent\" value=' + player.PlayerID + '>Sign</button></td></tr>';
}

// Create HTML option element for Team drop down which will be used in Trade Player Modal
function createTeamsDropdownForTradeModal(team) {
    return '<option value=\"' + team.TeamID + '\">' + team.TeamName + '</option>';
}








