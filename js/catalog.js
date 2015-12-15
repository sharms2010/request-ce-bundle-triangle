 // jQuery GET call used to get updates from the Alerts and Outages bundle
function getAlert(){
$.getJSON("alerts/for-display", function(data){
    $('.alert-outages-body').empty().append($('<p>', { text : data.date}));
    $('.alert-outages-body').append($('<div>', { text : data.details}));
}).always(function() {
    setAlertInterval();;
  });
};
function setAlertInterval(){
    setTimeout(getAlert, 5000);
}
getAlert();