searchConfig ={
	// Example of full configuration of a seach object to return results as a DataTable
	personSearchBridgeTable:{
		// type: "BridgeDataTable" or "BridgeList".  Determines default values to be used and behavior.
		type: "BridgeDataTable",
		// responsive: OPTIONAL Default for "BridgeDataTable" is true but can be over written.
		//responsive: false,
		bridgeConfig:{
			model: "By First and Last Name",
			//qualification_mapping: "By First Name or Last Name or Full Name",
			//Params to be created and passed to the Bridge.  VALUE MUST BE JQUERY SELECTOR.
			parameters: {'Full Name': '#requested_for input','First Name': '#requested_for input','Last Name': '#requested_for input'},
		},
		processSingleResult: true,
		// Properties in the data must match the attributes of the Bridge Request
		data: {
			"First Name":{
				title:"FIRST",
				className: "all",
                              
                                setField:"result firstname"
			},
			"Last Name":{
				title:"Last",
				className: "min-tablet",
				callback:function(value){
					console.log(value);
				},
				setField:"result lastname"
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
		// appendTo: $('div.search-slide'), // Not recommended to use jQuery object as it may not exist when evaluated.
		// appendTo: 'div.search-slide',
		appendTo: function(){return $('div.personTableDiv');},
		// OPTIONAL: Create Table function or string to become jQuery obj
		// table : '<table cellspacing="1", border="1", class="display test">',
		// table : function(){return ($('<table>', {'cellspacing':'0', 'border':'0', 'class': 'test2 display'})).attr('id',this.tableId);},
		//ID to give the table when creating it.
		resultsContainerId: 'requestedForTable',
		before: function(){ 
			console.log(this);
		},
		success: function (){
			console.log(this);
		},
		success_empty: function(){
			alert("No results Found");
		},
		error: function(){
			console.log(this);
		},
		complete: function(){
			console.log(this);
		},
		// Executes on click of element with class of select
		clickCallback: function(results){
                        $('#reqForUser').empty().append(results["First Name"]+ ' ' + results["Last Name"]);
			$('#closeModal').click()
		},
		createdRow: function ( row, data, index ) {
		},
		fnFooterCallback: function ( nRow, aaData, iStart, iEnd, aiDisplay ) {
			console.log(aaData);
		},
		dom: 'Brtip',
	},
	// Example of full configuration of a seach object to return results as a List
	personSearchBridgeList:{
		type: "BridgeList",
		bridgeConfig:{
			model: "Sample People",
			//Params to be created and passed to the Bridge.  VALUE MUST BE JQUERY SELECTOR.
			parameters: {'Full Name': '#requested_for input','First Name': '#requested_for input','Last Name': '#requested_for input'},
		},
		processSingleResult: true,
		data: {
                    "First Name":{
                        title:"FIRST",
                    },
                    "Last Name":{
                        title:"Last",
                        callback:function(value){
                                console.log(value);
                        },
                        setField:"result lastname"
                    },
                    "Email":{
                        title:"EMAIL",
                    },
                    "Login Id":{
                        title:"LOGIN",
                        setField:"ReqFor_Login ID"
                    },
                    "Work Phone Number":{
                        title:"PHONE",
                    }
		},
		appendTo: function(){return $(K('section[Section1]').element());},
		resultsContainerId: 'requestedForTable',
		clickCallback: function(results){
			console.log(results["First Name"]+ ' ' + results["Last Name"]);
		},
	},
	// Example configuration to over-ride SearchBridgeTable and return results as a List
	personSearchBridgeList2:{
		type: "BridgeList",
	},
}