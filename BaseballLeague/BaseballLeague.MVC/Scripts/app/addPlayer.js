var playeruri = "/api/PlayerAPI";
var playerCount = 0;

$(document).ready(function () {
    loadPlayers();
});

function loadPlayers() {
    $.getJSON(playeruri)
        .done(function (data) {
            $('#inputPlayers tr').remove();

            $.each(data, function (index, player) {
                playerCount++;
                $(createTableDataPlayer(player, playerCount)).appendTo($('#inputPlayers'));
            });
        });
};

function createTableDataPlayer(player) {
    if (player.SecondaryPosition == null) {
        player.SecondaryPosition = "-";
    };
    return '<tr value="' + player.PLayerID + '" class="' + player.TeamID + '"><td>' + playerCount + '</td><td>' + player.Name +
        '</td><td>' + player.JerseyNumber + '</td><td>' + player.TeamName + '</td><td>' +
        player.LastYearBA.toPrecision(3).toString().substring(1, 5) + '</td><td>' + player.YearsPlayed + '</td><td>' +
        player.PrimaryPosition + '</td><td>' + player.SecondaryPosition +
        '</td><td><button class="btn btn-xs btn-primary btnDeletePlayer">Delete</button></td></tr>';
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
        player.TeamID = $('#addPlayerTeamID').val();
        player.LastYearBA = $('#addPlayerLastYearBA').val();
        player.YearsPlayed = $('#addPlayerYearsPlayed').val();
        player.PrimaryPositionID = $('#addPlayerPrimaryPositionID').val();
        if ($('#addPlayerSecondaryPositionID').val() === "null") {
            player.SecondaryPositionID = null;
        } else {
            player.SecondaryPositionID = $('#addPlayerSecondaryPositionID').val();
        }


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