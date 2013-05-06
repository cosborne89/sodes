$(document).ready(function() {
//Function to remove the row that is deleted when the object is successfully deleted.
$('.delete_object').bind('ajax:success', function() {  
    $(this).closest('tr').fadeOut();
}); 
//Set up datepicker class
$('.datepicker').datepicker();

//Set up timepicker class
$('.timepicker').timepicker({'minTime': '6:00am', 'maxTime': '7:00pm'});

//document.ready closing tag
});

