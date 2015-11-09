$(document).ready(function(){
	$(".list").hide();
    $("#grid").click(function(){
        $(".grid").show();
        $(".list").hide();
    });
    $("#list").click(function(){
        $(".list").show();
        $(".grid").hide();
    });
    $(".fa-play").hover(function(){
        $(".easter").addClass("fa-spin");
    }, function(){
    	$(".easter").removeClass("fa-spin");
    });
});