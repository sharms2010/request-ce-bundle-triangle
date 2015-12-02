$(function(){
	$('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');

    // Take Cassandra Dates and Convert using Moment JS //
	var windowsLocale = window.navigator.userLanguage || window.navigator.language;
	$('.date-time-relative').each(function(){
		$(this).attr('title',$(this).html());
		$(this).html(moment($(this).html(), "ddd MMM D HH:mm:ss z YYYY", windowsLocale).fromNow(true));
		$(this).show();
	});

    // Function for Submit New request buton //
	$('#submitNew').click(function(event) {
		window.location.href = bundle.spaceLocation + "/ticket/ticket";
	});

	// Retrieve submission //
	$('#ticketDetails a').click(function(event) {
		event.preventDefault();

	});
	/*
	${submissions.retrieve(UUID submissionId)
	*/

	// Load submission in new tab //
	/*
	${bundle.spaceLocation}/submissions/${submission.id}
	*/

});