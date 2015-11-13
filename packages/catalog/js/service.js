
$(function(){
$('form .form-group input, form .form-group textarea, form .form-group select').addClass('form-control');

$('#personSearchModal').on('show.bs.modal', function (event) {
alert('yo yo yo');
var button = $(event.relatedTarget) // Button that triggered the modal
var recipient = button.data('personField') // Extract info from data-* attributes
// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
var modal = $(this)
modal.find('.modal-title').text('Update Field ' + recipient)
//modal.find('.modal-body input').val(recipient)

});

});