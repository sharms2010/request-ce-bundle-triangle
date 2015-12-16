 // jQuery GET call used to get updates from the Alerts and Outages bundle
function getAlert(){
$.getJSON("alerts/for-display", function(data){
    if(data.date){
    $('.alert-outages-body').empty().append($('<p>', { text : data.date}));
    $('.alert-outages-body').append($('<div>', { text : data.details}));
}else{
    $('.alert-outages-body').empty().append($('<div>', { text : 'there are no alerts at this time'}));
}
}).always(function() {
    setAlertInterval();;
  }).fail(function(){
    $('.alert-outages-body').empty().append($('<div>', { text : 'javascript failed to load'}));  
});
};
function setAlertInterval(){
    setTimeout(getAlert, 5000);
}
getAlert();