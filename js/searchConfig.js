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
//API Config
//    contentConfig:{
//        type: "ApiDataTable",
//        // responsive: OPTIONAL Default for "BridgeDataTable" is true but can be over written.
//        //responsive: false,
//        apiConfig:{
//            url: function(){return bundle.apiLocation()+'/kapps/'+bundle.kappSlug()+'/submissions'},
////            "space-slug": "professional-services",
////            "kapp-slug": "catalog",
////            "form-slug": "my-form",
//            //fields and values must be escaped with encodeURIComponent(item) within the query
////            query: {'Notification Name': function(){debugger; return K('field[Notification Name]').value();}},
//        },
//        processSingleResult: false,
//        clearOnClick:false,
//        // Properties in the data must match the attributes of the Bridge Request
//        data: {
//            "submittedAt":{
//                title:"FIRST",
//                className: "all",
//                //setField:"result firstname"
//            },
//            "submittedBy":{
//                title:"Last",
//                className: "min-tablet",
//                callback:function(value){;
//                    console.log(value);
//                },
//                //setField:"result lastname"
//            },
//            "id":{
//                title:"EMAIL",
//                className: "min-phone",
//            },
//            "Login Id":{
//                title:"LOGIN",
//                className: "none",
//            },
//            "Work Phone Number":{
//                title:"PHONE",
//                className: "hidden",
//            }
//        },
//        //Where to append the table
//        appendTo: function(){return $('div#personTableDiv');},
//        // OPTIONAL: Create Table function or string to become jQuery obj
//        resultsContainerId: 'requestedForTable',
//        //After the Table has been created.
//        before: function(){ //before search
//            
//        },
//        error: function(){
//        },
//        //Define action to take place after SDR is complete.
//        success: function (){
//        },
//        success_empty: function(){
//        },
//        complete: function(){
//        },
//        // Executes on click of element with class of select
//        clickCallback: function(results){
//        },
//        createdRow: function ( row, data, index ) {
//
//        $('td',row).eq(6).addClass("cursorPointer");
//            rowButtonHTML = '<i class="fa fa-pencil"></i>';
//            $('td',row).eq(6).html(rowButtonHTML);
//            $('td',row).eq(6).click(function(e) {
//                K('field[Record Type]').value("Content");
//                K('field[GlobalVsSpecific]').value(data["Global or Specific"]);
//                K('field[Scope]').value(data["Scope"]);
//                K('field[Language]').value(data["Language Type"]);
//                K('field[Specific Lanuage]').value(data["Language"]);
//                K('field[Subject]').value(data["Subject"]);
//                K('field[Body]').value(data["Body"]);
//                K('field[id]').value(data["id"]);
//
//            });
//        },
//            fnFooterCallback: function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
//        },
//        dom: 'Bfrtip',
//   }
}