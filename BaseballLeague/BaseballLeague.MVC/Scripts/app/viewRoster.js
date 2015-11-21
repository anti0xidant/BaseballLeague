var uriTrade = "/api/TradeAPI";

$(document).ready(function () {
    $('#btnShowSignFreeAgent').click(function () {
        $('#signFreeAgentModal').modal('show');
    });

    $('.btnTradePlayer').click(function () {

        $('#tradePlayerModal').modal('show');
        $('#tradePlayerID').val($(this).val());
    });
   

    $('#btnMakeTrade').click(function () {
        var playerTrade = {};

        playerTrade.PlayerID = $('#tradePlayerID').val();
        playerTrade.TeamID = $('#tradeTeamID').val();


        $.post(uriTrade, playerTrade)
            .done(function () {
                //loadRoster(playerTrade.TeamID);
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





