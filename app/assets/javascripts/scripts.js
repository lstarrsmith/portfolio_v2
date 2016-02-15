
$(document).ready(function(){
	if (window.images_loaded !== true) {
		showLoader();
		$('#page_content img').last().bind('load', function() {
			showPage()
			window.images_loaded = true
		});
	}
})

// turbolinks requires page:change and page:load events, as images are technically already loaded 
// after the initial page load, they're just replaced with ajax. So the logic here is that on the initial
// page load, page:change fires and shows the loading image, then when the last image loads, we call showPage()
// to fade in the page_content div. This last image loads after page:load for some reason, which is why we can't 
// call the showPageAfterLoad function. Then we set window.images_loaded = true so that on subsequent page changes, we
// fire the same sequence but tie it to page:load... it's important to note that page:load doesn't fire on the initial page 
// load for some reason, which is why we have to break it up

// The page:load fires only when a particular piece of markup (body or partial replacement) is inserted in the DOM for the first time

// $(document).on('page:change', function() {
// 	if (window.images_loaded !== true) {
// 	} else {
// 		showLoader();
// 		showPage();
// 	}
// 	$('.dropdown-toggle').dropdown()
// })

// putting the selection at the top right before the page refreshes
$(".dropdown-menu li a").click(function(){
  var selText = $(this).text();
  $(this).parents('.dropdown').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
});

// ************ FUNCTIONS FOR LOADING SPINNER *************//

function showLoader() {
	$('#page_content').hide();
	$('#loader').show();
}

// function showPageAfterLoad() {
// 	$(document).on('page:load', function() {
// 		$('#loader').hide();
// 		$('#page_content').fadeIn('1000');
// 	})
// }

function showPage() {
	$('#loader').hide();
	$('#page_content').fadeIn('1000');
}

// ************ Saving in case *************//


// $(document).ready(function() {
// 	console.log("1")
// 	if (window.images_loaded === true) {
// 		console.log("2")
// 	} else {
// 		//when last image loads, remove the spinner and fade in page content
// 		showLoader();
// 		$('#page_content img').last().bind('load', function() {
// 			console.log("3")
// 			showPage()
// 			window.images_loaded = true
// 		});
// 	};
// 	// resetting the dropdown because bootstrap is f'ing up after a page load
//  	$('.dropdown-toggle').dropdown()
// });


