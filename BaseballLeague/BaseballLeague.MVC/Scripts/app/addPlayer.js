var playeruri = "/api/PlayerAPI";

$(document).ready(function () {
    loadPlayers();
});

function loadPlayers() {
    $.getJSON(playeruri)
        .done(function (data) {
            $('#inputPlayers tr').remove();

            $.each(data, function (index, player) {
                $(createTableDataPlayer(player)).appendTo($('#inputPlayers'));
            });
        });
};

function createTableDataPlayer(player) {
    if (player.SecondaryPosition == null) {
        player.SecondaryPosition = "-";
    };
    return '<tr value="' + player.PLayerID + '"><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.TeamID + '</td><td>' + player.LastYearBA.toPrecision(3).toString().substring(1, 5) + '</td><td>' + player.YearsPlayed + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td></tr>';
}

$(document).ready(function () {
    $('#btnShowAddPlayer').click(function () {
        $('#addPlayerModal').modal('show');
    });

    $('#btnSavePlayer').click(function () {
        var player = {};

        player.FirstName = $('#addPlayerFirstName').val();
        player.LastName = $('#addPlayerLastName').val();
        player.JerseyNumber = $('#addPlayerJerseyNumber').val();
        player.Team = $('#addPLayerTeam').val();
        player.LastYearBA = $('#addPlayerLastYearBA').val();
        player.YearsPlayed = $('#addPlayerYearsPlayed').val();
        player.PrimaryPositionID = $('#addPlayerPrimaryPositionID').val();
        player.SecondaryPositionID = $('#addPlayerSecondaryPositionID').val();


        $.post(playeruri, player)
            .done(function () {
                loadPlayers();
                $('#addPlayerModal').modal('hide');
            })
            .fail(function (jqXhr, status, err) {
                alert(status + ' - ' + err);
            });
    });
});