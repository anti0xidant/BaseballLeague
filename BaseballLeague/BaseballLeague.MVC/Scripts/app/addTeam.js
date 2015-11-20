var uri = "/api/TeamAPI";

$(document).ready(function () {
    $('#btnShowAddTeam').click(function () {
        $('#addTeamModal').modal('show');
    });

    $('#btnSaveTeam').click(function () {
        var team = {};

        team.LeagueID = $('#addLeagueID').val();
        team.TeamName = $('#addTeamName').val();
        team.ManagerName = $('#addManagerName').val();

        $.post(uri, team)
            .done(function () {
                loadTeams();
                $('#addTeamModal').modal('hide');
            })
            .fail(function (jqXhr, status, err) {
                alert(status + ' - ' + err);
            });
    });
});

function loadTeams() {
    $.getJSON(uri)
        .done(function (data) {
            $('#teamsTable td').remove();
            var count = 0; 
            $.each(data, function (index, team) {
                count++; 
                $(createTableDataTeam(team, count)).appendTo($('#teamsTable'));
            });
        });
};

function createTableDataTeam(team, count) {
    return '<tr><td>'+ count +'</td><td>' + team.TeamName + '</td><td>' + team.ManagerName + '</td><td>' + team.LeagueName + '</td>' + '<td><a href=/Team/PlayersOnTeam?TeamID=' + team.TeamID + '&TeamName=' + team.TeamName +'>View Roster</a></td></tr>';
}

