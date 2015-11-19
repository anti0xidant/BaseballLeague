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

            $.each(data, function (index, team) {
                $(createTableDataTeam(team)).appendTo($('#teamsTable'));
            });
        });
};

function createTableDataTeam(team) {
    return '<tr><td value="' + team.TeamName + '"><td>' + team.TeamName + '</td><td>' + team.ManagerName + '</td><td>' + team.LeagueName + '</td></tr>';
}

