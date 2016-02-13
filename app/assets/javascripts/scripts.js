$(document).ready(function() {
	// if (typeof image_loaded === 'undefined') {
	// 	// when user browses to page
	// 	$('#page_content').hide();
	// 	$('#loader').show();

	// 	$('#page_content img').last().bind('load', function() {
	// 		$('#loader').hide();
	// 		$('#page_content').fadeIn('1000');
	// 		window.images_loaded = true
	// 	});
	// } else if (window.images_loaded == true) {
	// 	debugger
	// 	$('#loader').hide();
	// 	$('#page_content').fadeIn('1000');
	// }
	// resetting the dropdown because bootstrap is f'ing up after a page load
 	$('.dropdown-toggle').dropdown()
});

// putting the selection at the top right before the page refreshes
$(".dropdown-menu li a").click(function(){
  var selText = $(this).text();
  $(this).parents('.dropdown').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
});



