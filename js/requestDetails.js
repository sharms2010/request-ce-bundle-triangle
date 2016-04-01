(function($){
    /*Control the height of left and right sides for use with background.*/
    $(document).ready(function() {
        var height = Math.max($("#leftDetails").height(), $("#rightDetails").height());
        $("#leftDetails").height(height);
        $("#rightDetails").height(height);
    });
})(jQuery);