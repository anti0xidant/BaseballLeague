$(document).ready(function () {
    filterByTeam();
});

function filterByTeam() {

    $('#team-select').bind("change", function () {
        if (this.value !== "All") {
            $("." + this.value).show();
            $("tbody tr:not(." + this.value + ")").hide();
        } else {
            $("tbody tr:not(." + this.value + ")").show();
        }
    });
};