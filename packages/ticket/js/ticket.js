$(function(){
	$('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');

	
	$('.date-time-relative').each(function(){
		$(this).html(moment($(this).html(), "ddd MMM D HH:mm:ss z YYYY",'en').fromNow());
	});
});