(function($){
searchConfigs = {
    personSearchBridgeTable:{
        type: "BridgeDataTable",
        //responsive: OPTIONAL Default for "BridgeDataTable" is true but can be over written.
        //responsive: false,
        bridgeConfig:{
            model: "Search By Name",
            //qualification_mapping: "Recipients By Notification",
            //Params to be created and passed to the Bridge.  VALUE MUST BE JQUERY SELECTOR.
            parameters: {'Notification Name': function(){ return K('field[name]').value();}},
        },
        processSingleResult: false,
        clearOnClick:false,
        //Properties in the data must match the attributes of the Bridge Request
        data:{
            "First Name":{
                title:"FIRST",
                className: "all",
                //setField:"result firstname"
            },
            "Last Name":{
                title:"Last",
                className: "min-tablet",
                callback:function(value){;
                    console.log(value);
                },
                //setField:"result lastname"
            },
            "Email":{
                title:"EMAIL",
                className: "min-phone",
            },
            "Login Id":{
                title:"LOGIN",
                className: "none",
            },
            "Work Phone Number":{
                title:"PHONE",
                className: "hidden",
            }
        },
        //Where to append the table
        appendTo: function(){return $('div#personTableDiv');},
        // OPTIONAL: Create Table function or string to become jQuery obj
        //ID to give the table when creating it.
        resultsContainerId: 'requestedForTable',
        //After the Table has been created.
        before: function(){ //before search
        },
        error: function(){
        },
        //Define action to take place after SDR is complete.
        success: function (){
        },
        success_empty: function(){
            $('#requestedForTable_wrapper').remove();
            $('#personTableDiv').empty().append('<p id="searchNotFound" class="m-b-3 text-center">No one matiching that name could be found</p>');
        },
        complete: function(){
        },
        // Executes on click of element with class of select
        clickCallback: function(results){
            $('#reqForUser').empty().append(results["First Name"]+ ' ' + results["Last Name"]);
            $('#closeModal').click()
        },
        createdRow: function ( row, data, index ) {
        
        },
        fnFooterCallback: function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
        },
        dom: 'Brtip',
   },
};
})(jQuery);