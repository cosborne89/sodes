$(document).ready(function() {

//Function to unhide/hide All/New when you mouse over a banner object

$('.dropdown').each(function () {
	$(this).parent().eq(0).hover(function () {
		$('.dropdown:eq(0)', this).show();
		}, function () {
			$('.dropdown:eq(0)', this).hide();
		});
});


//document.ready closing tag
});
