$(function() {
    $('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');
    
    $('#helperFormList .list-group a').click(function(){
        // Ajax call to get HTML
        $.ajax({
            method: 'get',
            url: '?partial=helperSubmissionList',
            data: {"formSlug":$(this).data("for")},
            success: function(data, textStatus, jqXHR){
                $('#helperObjectDetails').html(data);
            },
            error: function(jqXHR, textStatus, errorThrown){
                $('#helperObjectDetails').html('<b>Error fetching HTML</b>');
            }
        });

    });

    // Helper Console Search Submissions
    $('#search').on('keyup', function(event) {
        var term = $(this).val().toLowerCase();
        console.log(term);
        $('#helperSubmissionList li a').each(function() {
            if ($(this).text().toLowerCase().indexOf(term) > -1) {
                $(this).parent().show();
            } else {
                $(this).parent().hide();
            }
        });
    });

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


