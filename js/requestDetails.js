(function($){
    /*Control the height of left and right sides for use with background.*/
    $(function() {
        leftColumnHeight = $(window).height()-521;
        $('#left-column').css('min-height',leftColumnHeight);
    
        var height = Math.max($("#left-column").height(), $('#right-column').height());
        $("#left-column").height(height);
        $("#right-column").height(height);
    });
})(jQuery);
    