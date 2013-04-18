$(document).ready(function() {
//Function to remove the row that is deleted when the object is successfully deleted.
$('.delete_object').bind('ajax:success', function() {  
    $(this).closest('tr').fadeOut();
    $(this).before('.spacer-row').fadeOut(); //This needs to go to the spacer-row ABOVE it, not just the closest  
}); 


//document.ready closing tag
});

