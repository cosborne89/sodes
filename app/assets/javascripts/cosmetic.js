$(document).ready(function() {

//Function to unhide All/New when you mouse over a banner object
$('.banner-object-child').hide();
$('.banner-object').mouseenter(function() {
	$(this).children(".banner-object-child").show("slide", { direction: "right" }, 500);
});
$('.banner-object').mouseleave(function() {
	$(this).children(".banner-object-child").hide();
});

//document.ready closing tag
});
