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
        var PlayerID = $('#releasePlayerID').val();
        var TeamID = $('#currentTeamID').val();
        $.ajax({
            url: '/api/PlayerAPI/ReleasePlayer?PlayerID=' + PlayerID,
            type: 'PUT',
            success: function (data, status, xhr) {
                $('#releasePlayerModal').modal('hide');
                loadRoster(TeamID);
                setupButtons();
            },
            error: function (xhr, status, err) {
                alert('error:' + err);
            }
        });
        
    });

    setupButtons();

});

function signFreeAgent(TeamID, PlayerID) {
    $.ajax({
        url: '/api/TradeAPI/SignFreeAgent?TeamID=' + TeamID + "&PlayerID=" + PlayerID,
        type: 'PUT',
        success: function(data, status, xhr) {
            $('#signFreeAgentModal').modal('hide');
            loadRoster(TeamID);
            setupButtons();
        },
        error: function(xhr, status, err) {
            alert('error:' + err);
        }
    });
};


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
        $('#releasePlayerTeamID').val($('#currentTeamID').val());
    });

};

function loadRoster(TeamID) {

    $.ajax({
        url: '/api/TradeAPI/GetFullRoster?TeamID=' + TeamID,
        type: 'GET',
        success: function(data, status, xhr) {
            $('#teamRoster').empty();

            var playerCount = 0;
            $.each(data, function(index, player) {
                playerCount++;
                $(createTableDataPlayer(player, playerCount)).appendTo($('#teamRoster'));

            });
        }
    });
    //$.getJSON('/api/TradeAPI/GetFullRoster?TeamID=' + TeamID)
    //    .done(function(data) {
    //        $('#teamRoster').empty();

    //        var playerCount = 0;
    //        $.each(data, function(index, player) {
    //            playerCount++;
    //            $(createTableDataPlayer(player, playerCount)).appendTo($('#teamRoster'));

    //        });
    //    });
};

function createTableDataPlayer(player, count) {
    return '<tr><td>' + count + '</td><td>' + player.Name + '</td><td>' + player.JerseyNumber + '</td><td>' + player.LastYearBA + '</td><td>' + player.PrimaryPosition + '</td><td>' + player.SecondaryPosition + '</td><td>' + player.YearsPlayed + '</td><td><button class=\"btn btn-primary btn-xs btnTradePlayer\" value=' + player.PlayerID + '>Trade</button></td>' +
        '<td><button class=\"btn btn-primary btn-xs btnReleasePlayer\" value=' + player.PlayerID + '>Release</button></td></tr>';
}










