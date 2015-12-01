$(document).ready(function () {

    // Initial load of Teams Table
    loadTeams();

    // Initial load of league dropdown filter and modal league selection drop down
    buildLeagueDropdown();

    // Adds click event to trigger Modal when Add Team button is pressed
    $('#btnShowAddTeam').click(function () {
        $('.addTeamForm').val("");
        $('#addLeagueID').val(1);
        $('#addTeamModal').modal('show');
    });
    
    /* Adds click event to Save Team button in New Team Modal. This event creates
       a Team JSON object and binds to it the appropriate field values from the
       New Team modal. It then sends the JSON to the webapi via AJAX POST */
    $('#btnSaveTeam').click(function () {
        var team = {};

        team.LeagueID = $('#addLeagueID').val();
        team.TeamName = $('#addTeamName').val();
        team.ManagerName = $('#addManagerName').val();

        $.ajax({
            url: '/api/TeamAPI/PostNewTeam',
            type: 'POST',
            data: team,
            success: function() {
                loadTeams();
                $('#addTeamModal').modal('hide');
            },
            error: function(jqXhr, status, err) {
                alert(status + '-' + err);
            }
        });
    });
});

// Grabs the list of Leagues and loads it into the filter drop down and selection dropdown
function buildLeagueDropdown() {
    $.ajax({
        url: '/api/TeamAPI/GetLeagueDropDown',
        type: 'GET',
        success: function(data, status, xhr) {
            $.each(data, function(index, league) {
                $(createDropDownLeague(league)).appendTo($('#addLeagueID'));
                $(createDropDownLeague(league)).appendTo($('#selectLeague'));
            });
        }
    });
}

// Grabs the list of teams via AJAX GET. Then clears Team Table. Finally, loads new data.
function loadTeams() {
    $.ajax({
        url: '/api/TeamAPI/GetAllTeams',
        type: 'GET',
        success: function(data, status, xhr) {
            $('#teamsTable').empty();

            $.each(data, function(index, team) {
                $(createTableDataTeam(team, index)).appendTo($('#teamsTable'));
            });
        }
    });
};

// Creates HTML table row of team data which is used to populate the Team Table in loadTeams()
function createTableDataTeam(team, count) {
    return '<tr class=\"' + team.LeagueID + '\"><td>'+ (count + 1) +'</td><td>' + team.TeamName + '</td><td>' + team.ManagerName + '</td><td>' + team.LeagueName + '</td>' + '<td><a href=/Team/PlayersOnTeam?TeamID=' + team.TeamID + '&TeamName=' + team.TeamName +'>View Roster</a></td></tr>';
}

// Creates HTML dropdown list Option element
function createDropDownLeague(league) {
    return '<option value=\"' + league.LeagueID + '\">' + league.LeagueName + '</option>';
}
