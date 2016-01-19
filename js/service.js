$(function(){
    $('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');

    $('#personSearchModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        
        /*Not sure what this code was meant to do*/
        //var recipient = button.data('personField') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        //var modal = $(this)
        //modal.find('.modal-title').text('Update Field ' + recipient)
        
        //modal.find('.modal-body input').val(recipient)
        $('#searchForPerson').click(function(){
                       
            K('field[first name]').value(document.getElementById('first-name').value)
            K('field[last name]').value(document.getElementById('last-name').value)
            
            var resourceName;
            if (K('field[first name]').value() && K('field[last name]').value()) {
                resourceName = 'By First and Last Name';
            } else if (K('field[first name]').value()) {
                resourceName = 'By First Name';
            } else if (K('field[last name]').value()) {
                resourceName = 'By Last Name';
            }
            obj2 = {bridgeConfig:{
			model:resourceName,}}
            KDSearch.executeSearch(searchConfig.personSearchBridgeTable,obj2);
        });
    });
});

