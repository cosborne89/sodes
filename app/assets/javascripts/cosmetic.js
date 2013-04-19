$(document).ready(function() {

//Function to unhide/hide All/New when you mouse over a banner object
$('.banner-object').mouseenter(function() {
	$(this).children('.banner-object-child').toggle(400);
	$(this).children('.banner-object-child').css("display", "inline-block");
});
$('.banner-object').mouseleave(function() {
		$(this).children('.banner-object-child').toggle(400, function() {
			$(this).children('.banner-object-child').css("display", "none");
		});
		
});


//Sort/Filter Tasks 
$('#tasks th a, #tasks ul li').click( function() {
	$.getScript("tasks");
	return false;
//	
});

//document.ready closing tag
});
