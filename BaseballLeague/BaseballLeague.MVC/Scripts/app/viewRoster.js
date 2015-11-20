var uriTrade = "/api/TradeAPI";

$(document).ready(function () {
    $('#btnShowSignFreeAgent').click(function () {
        $('#signFreeAgentModal').modal('show');
    });

    $('.btnTradePlayer').click(function () {

        $('#tradePlayerModal').modal('show');
        $('#tradePlayedID').val($(this).val());
    });
   

    $('#btnMakeTrade').click(function () {
        var playerTrade = {};

        playerTrade.PlayerID = $('#tradePlayedID').val();
        playerTrade.TeamID = $('#tradeTeamID').val();


        $.post(uriTrade, playerTrade)
            .done(function () {
                //loadPlayers();
                $('#tradePlayerModal').modal('hide');
            })
            .fail(function (jqXhr, status, err) {
                alert(status + ' - ' + err);
            });
    });

    $('.btnReleasePlayer').click(function () {

        $('#releasePlayerModal').modal('show');
        $('#releasePlayerID').val($(this).val());
    });

    $('#btnRelease').click(function () {

        $('#releasePlayerModal').modal('hide');
    });

});



