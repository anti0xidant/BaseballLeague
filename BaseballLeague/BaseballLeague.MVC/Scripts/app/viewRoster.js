$(document).ready(function () {

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

    // Used .on() instead of .click() because .on() also adds event handlers to future elements 
    // whereas .click() only adds to elements that exist during initial load.
    // The 'Sign' button of SignFreeAgent modal do not exist until the modal is displayed,
    // therefore, .on() is the appropriate choice. .on() is a combination of .live() and .bind().
    $(document).on("click", ".btnSignFreeAgent", function() {

        var PlayerID = $(this).val();
        var TeamID = $('#currentTeamID').val();

        $.ajax({
            url: '/api/TradeAPI/SignFreeAgent?TeamID=' + TeamID + "&PlayerID=" + PlayerID,
            type: 'PUT',
            success: function (data, status, xhr) {
                $('#signFreeAgentModal').modal('hide');
                loadRoster(TeamID);
                setupButtons();
            },
            error: function (xhr, status, err) {
                alert('error:' + err);
            }
        });

    });
    
    $('#btnMakeTrade').click(function () {
        var playerTrade = {};

        playerTrade.PlayerID = $('#tradePlayerID').val();
        playerTrade.TeamID = $('#tradeTeamID').val();

        


        $.post(uriTrade, playerTrade)
            .done(function () {
                loadRoster($('#currentTeamIDModal').val());
                $('#tradePlayerModal').modal('hide');
                setupButtons();
            })
            .fail(function (jqXhr, status, err) {
                alert(status + ' - ' + err);
            });
    });

    $('#btnRelease').click(function () {
        var PlayerID = $('#releasePlayerID').val();
        var TeamID = $('#currentTeamID').val();
        $.ajax({
            url: '/api/PlayerAPI/ReleasePlayer?PlayerID=' + PlayerID,
            type: 'PUT',
            success: function (data, status, xhr) {
                $('#releasePlayerModal').modal('hide');
                loadRoster(TeamID);
                setupButtons();
            },
            error: function (xhr, status, err) {
                alert('error:' + err);
            }
        });
        
    });

    setupButtons();

});


//This function will be called anytime dynamic trade and release buttons are added to the screen
function setupButtons() {

    $('#table').on('click', '.btnTradePlayer', function () {

        $('#tradePlayerModal').modal('show');
        $('#tradePlayerID').val($(this).val());
        $('#currentTeamIDModal').val($('#currentTeamID').val());
        //var table = $("#table")[0];
        //var cell = table.rows[5].cells[1];
        //alert($(cell).text());
    });

    $('#table').on('click','.btnReleasePlayer', function () {

        $('#releasePlayerModal').modal('show');
        $('#releasePlayerID').val($(this).val());
        $('#releasePlayerTeamID').val($('#currentTeamID').val());
    });

};

// Uses the TeamID from the Team Index page to make an AJAX call to retrieve complete roster from API.
// Upon success, the roster table is FIRST cleared, THEN repopulated with data from the AJAX call.
function loadRoster() {
    var TeamID = $('#currentTeamID').val();

    $.ajax({
        url: '/api/TradeAPI/GetFullRoster?TeamID=' + TeamID,
        type: 'GET',
        success: function(data, status, xhr) {
            $('#teamRoster').empty();

            var playerCount = 0;
            $.each(data, function(index, player) {
                playerCount++;
                $(createTableDataPlayer(player, playerCount)).appendTo($('#teamRoster'));

            });
        }
    });
};

function createTableDataPlayer(player, count) {
    return '<tr><td>' + count + '</td><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.LastYearBA + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td><td>' + player.YearsPlayed + '</td><td><button class=\"btn btn-primary btn-xs btnTradePlayer\" value=' + player.PlayerID + '>Trade</button></td>' +
        '<td><button class=\"btn btn-primary btn-xs btnReleasePlayer\" value=' + player.PlayerID + '>Release</button></td></tr>';
}

// Builds The Free Agents table of SignFreeAgent Modal. The table includes a Sign button which has
// value of PlayerID
function createTableDataFreeAgents(player) {
    return '<tr><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.LastYearBA + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td><td>' + player.YearsPlayed + '</td><td><button class=\"btn btn-primary btn-xs btnSignFreeAgent\" value=' + player.PlayerID + '>Sign</button></td></tr>';
}








