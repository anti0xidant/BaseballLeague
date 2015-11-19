var playeruri = "/api/PlayerAPI";

$(document).ready(function () {
    loadPlayers();
});

function loadPlayers() {
    $.getJSON(playeruri)
        .done(function (data) {
            $('#inputPlayers td').remove();

            $.each(data, function (index, player) {
                $(createTableDataPlayer(player)).appendTo($('#inputPlayers'));
            });
        });
};

function createTableDataPlayer(player) {
    return '<tr><td value="' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.Team + '</td><td>' + player.LastYearBA + '</td><td>' + player.YearsPlayed + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td></tr>';
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
        player.PrimaryPosition = $('#addPlayerPrimaryPosition').val();
        player.SecondaryPosition = $('#addPlayerSecondaryPosition').val();


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