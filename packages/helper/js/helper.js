$(function() {
    $('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');
    $('#helperFormList .list-group a').click(function(){
        var id = $(this).attr('data-for');
        // Define container
        var detailsContainer = $('#helperSubmissionList');
        // Set ajax options
        var ajaxOptions = {
            dataType: 'html',
            cache: false,
            type: 'get',
            //url: encodeURI(BUNDLE.packagePath + 'interface/callbacks/osc/tasks.html.jsp?id=' + id),
            url: BUNDLE.config.oscPackageUrl + '&callback=tasks' + '&id=' + id,
            beforeSend: function(jqXHR, settings) {
                // Display loader
                detailsContainer.html(loader);
            },
            success: function(data, textStatus, jqXHR) {
                // Load results into ui
                detailsContainer.html(data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Clear container
                detailsContainer.empty();
                alert('An error has occurred attempting to get the objects reords');
            }
        };
        // Execute the ajax request.
        BUNDLE.ajax(ajaxOptions);        
    })
});








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


