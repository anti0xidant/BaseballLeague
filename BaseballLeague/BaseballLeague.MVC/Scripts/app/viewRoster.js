var uriTrade = "/api/TradeAPI";

$(document).ready(function () {
    $('#btnShowSignFreeAgent').click(function () {
        $('#signFreeAgentModal').modal('show');
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

        $('#releasePlayerModal').modal('hide');
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
    });

};

function loadRoster(TeamID) {

    var team = {};

    team.TeamID = TeamID; 
    $.getJSON(uriTrade, team)
        .done(function (data) {
            $('#table td').remove();
            var count = 0;
            $.each(data, function (index, player) {
                count++;
                $(createTableDataPlayer(player, count)).appendTo($('#table'));
            });
        });
};

function createTableDataPlayer(player, count) {
    return '<tr><td>' + count + '</td><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.LastYearBA + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td><td>' + player.YearsPlayed + '</td><td><button class=\"btn btn-primary btn-xs btnTradePlayer\" value=' + player.PlayerID + '>Trade</button></td>' +
        '<td><button class=\"btn btn-primary btn-xs btnReleasePlayer\" value=' + player.PlayerID + '>Release</button></td></tr>';
}










