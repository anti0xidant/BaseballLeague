$(document).ready(function () {
    filterByLeague();
});

function filterByLeague() {
    $('#selectLeague').bind("change", function () {
        if (this.value != "All") {
            $("." + this.value).show();
            $("tbody tr:not(." + this.value + ")").hide();
        } else {
            $("tbody tr:not(." + this.value + ")").show();
        }
    });
};