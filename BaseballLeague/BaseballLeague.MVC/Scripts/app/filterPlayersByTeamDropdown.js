$(document).ready(function () {
    filterByTeam();
});

function filterByTeam() {
    $('#team-select').bind("change", function() {
        $("." + this.value).show();
        $("tbody tr:not(." + this.value + ")").hide();
    });
};