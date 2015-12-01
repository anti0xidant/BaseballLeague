var playeruri = "/api/PlayerAPI";

$(document).ready(function () {
    loadPlayers();
});

function loadPlayers() {
    $.getJSON(playeruri + '/Get')
        .done(function (data) {
            $('#inputPlayers tr').remove();
           
            $.each(data, function (index, player) {
                $(createTableDataPlayer(player, index)).appendTo($('#inputPlayers'));
            });
            $(document).ready(function () {
                $('.btnShowDeletePlayerModal').on("click", function () {
                    $('#DeletePlayerID').val($(this).val());
                    $('#DeletePlayerMessage').html("Are you sure you want to delete " + $('td:nth-child(2)').html() + "?");
                    $('#deletePlayerModal').modal('show');
                    $('#btnDeletePlayer').click(function () {
                        var playerID = $('#DeletePlayerID').val();

                        $.ajax({
                            url: playeruri + "/DeletePlayer?id=" + playerID,
                            type: "DELETE",
                            success: function () {
                                $('#deletePlayerModal').modal('hide');
                                loadPlayers();
                            }
                            
                        });
                    });
                });
            });
        });
};

function createTableDataPlayer(player, idexx) {
    if (player.SecondaryPosition == null) {
        player.SecondaryPosition = "-";
    };
    if (player.TeamName == null) {
        player.TeamName = "Free Agent";
    };
    return '<tr value="' + player.PlayerID + '" class="' + player.TeamID + '"><td>' + (idexx + 1) + '</td><td>' + player.Name +
        '</td><td>' + player.JerseyNumber + '</td><td>' + player.TeamName + '</td><td>' +
        player.LastYearBA.toPrecision(3).toString().substring(1, 5) + '</td><td>' + player.YearsPlayed + '</td><td>' +
        player.PrimaryPosition + '</td><td>' + player.SecondaryPosition +
        '</td><td><button class="btn btn-xs btn-danger btnShowDeletePlayerModal" value="' + player.PlayerID + '">Delete</button></td></tr>';
}

$(document).ready(function () {
    $('#btnShowAddPlayer').click(function () {
        $('.addPlayerForm').val("");
        $('.addPlayerDropDown').val(1);
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


        $.post(playeruri + '/Post/', player)
            .done(function () {
                loadPlayers();
                $('#addPlayerModal').modal('hide');
            })
            .fail(function (jqXhr, status, err) {
                alert(status + ' - ' + err);
            });
    });
});