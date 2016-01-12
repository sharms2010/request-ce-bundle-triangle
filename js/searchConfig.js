
// Define Table objects or list Object and initialize them.
searchConfig ={
    requestedForTableConfig:{
            // type: "BridgeDataTable" or "BridgeList".  Determines default values to be used and behavior.
            type: "BridgeDataTable",
            // responsive: OPTIONAL Default for "BridgeDataTable" is true but can be over written.
            //responsive: false,
            bridgeConfig:{
                    model: "local user",
                    qualification_mapping: "By Display Name",
                    //Params to be created and passed to the Bridge.  VALUE MUST BE JQUERY SELECTOR.
                    parameters: {'Full Name': '#requested_for input','First Name': '#requested_for input','Last Name': '#requested_for input'},
            },
            processSingleResult: true,
            // Properties in the data must match the attributes of the Bridge Request
            data: {
                "First Name":{
                        title:"FIRST",
                        className: "all",
                        setQstn:"ReqFor_First Name",
                },
                "Last Name":{
                        title:"Last",
                        className: "min-tablet",
                        callback:function(value){
                                console.log(value);
                        },
                        setQstn:"ReqFor_Last Name"
                },
                "Email":{
                        title:"EMAIL",
                        className: "min-phone",
                        setQstn:"ReqFor_Email"
                },
                "Login Id":{
                        title:"LOGIN",
                        className: "none",
                        setQstn:"ReqFor_Login ID"
                },
            
            },
            //Where to append the table
            // appendTo: $('div.search-slide'), // Not recommended to use jQuery object as it may not exist when evaluated.
            // appendTo: 'div.search-slide',
            appendTo: function(){return $('div.search-slide');},
            // OPTIONAL: Create Table function or string to become jQuery obj
            // table : '<table cellspacing="1", border="1", class="display test">',
            // table : function(){return ($('<table>', {'cellspacing':'0', 'border':'0', 'class': 'test2 display'})).attr('id',this.tableId);},
            //ID to give the table when creating it.
            tableId: 'requestedForTable',
            //After the Table has been created.
            afterInit: function(){ //completeCallback
            },
            before: function(){ //before search
                    toggleUnclickable($('#requested_for'));
            },
            // After Table Load
            loadedcallback: function(){
                    togglePanel(this);
            },
            //Define action to take place after SDR is complete.
            success: function (){
                    toggleUnclickable($('#requested_for'));
            },
            noResults: function(){
                    alert("No results Found");
                    toggleUnclickable($('#requested_for'));
            },
            // Executes on click of element with class of select
            clickCallback: function(results){
                    $('#requested_for input').val(results["First Name"]+ ' ' + results["Last Name"]);
                    togglePanel(this);
            },
            createdRow: function ( row, data, index ) {
            },
            fnFooterCallback: function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
                    console.log(aaData);
            },
            dom: 'Bfrtip',
    },
}