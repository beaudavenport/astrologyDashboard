$(function() {
	var parseRSS = function(url, successCallback, errorCallback) {
	  $.ajax({
	    url: document.location.protocol + '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&callback=?&q=' + encodeURIComponent(url),
	    dataType: 'json',
	    success: function(data) {
	      	successCallback(data.responseData.feed);
	    },
	    error: function(er) {
	    	errorCallback();
	    }
	  });
	}
	
	parseRSS('https://nikiastro.wordpress.com/feed/', function(feed) {
		$('.blog-content').html(feed.entries[0].content);
		console.log(feed);
	}, function() {
		$('.blog-content').html(
			"<p>Can't load blog content. View more posts here: " +
			"<a href='http://astrosynergistics.blogspot.com'>Astrosynergistics</a></p>"
			);
	});
});