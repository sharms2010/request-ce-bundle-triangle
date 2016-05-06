(function($){
    // UTILITY METHODS
    
    /**
     * Returns an Object with keys/values for each of the url parameters.
     * 
     * @returns {Object}
     */
    bundle.getUrlParameters = function() {
       var searchString = window.location.search.substring(1), params = searchString.split("&"), hash = {};
       for (var i = 0; i < params.length; i++) {
         var val = params[i].split("=");
         hash[unescape(val[0])] = unescape(val[1]);
       }
       return hash;
    };

    /**
     * Applies the Jquery DataTables plugin to a rendered HTML table to provide 
     * column sorting and Moment.js functionality to date/time values.
     * 
     * @param {String} tableId The id of the table element.
     * @returns {undefined}
     */
    function submissionsTable (tableId) {
        $('#'+tableId).DataTable({
            dom: '<"wrapper">t',
            columns: [ { defaultContent: ''}, null, null, null, null ],
            columnDefs: [
                { 
                    render: function ( cellData, type, row ) {
                        var span = $('<a>').attr('href', 'javascript:void(0);');
                        var iso8601date = cellData;
                        $(span).text(moment(iso8601date).fromNow())
                            .attr('title', moment(iso8601date).format('MMMM Do YYYY, h:mm:ss A'))
                            .addClass('time-ago')
                            .data('toggle', 'tooltip')
                            .data('placement', 'top');
                        var td = $('#'+tableId+' td:contains('+cellData+')');
                        td.html(span);
                        return td.html();
                    },
                    targets: 'date'
                },
                {
                    orderable: false,
                    targets: 'nosort'
                }
            ]
        });
    }
    
    // PAGE LOAD EVENTS
    $(document).ready(function(){
        // Prepare portal events
        $('#profile').click(function(){
            $('#navbar-collapse').removeClass('in');
            $('#search').addClass("collapsed");
        });
        $('#categories').click(function(){
            $('#navbar-collapse').removeClass('in');
            $('#search').addClass("collapsed");
        });
        $('#search-button').on('click', function(){
           $(this).closest('form').submit();
        });

        //  Add the query parameter to the search field on the search page
        if(bundle.getUrlParameters().page === 'search'){
            $('.predictiveText').val(bundle.getUrlParameters().q)
        }

        // Moment-ify any elements with the data-moment attribute
        $('[data-moment]').each(function(index, item) {
            var element = $(item);
            element.html(moment(element.text()).format('MMMM Do YYYY, h:mm:ss A'));
        });
    });
})(jQuery);