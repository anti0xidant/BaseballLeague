$(document).ready(function () {
    filterByTeam();
});

function filterByTeam() {
    $('#team-select').bind("change", function() {
        $("." + this.value).show();
        $("tr:not(." + this.value + ")").hide();
    });
};