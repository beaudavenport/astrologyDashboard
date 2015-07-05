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
		var lastEntry = feed.entries[0];
		var $entryContent = $(lastEntry.content);
		var $blogContent= $entryContent.filter("p").slice(0,2);
		$('.blog-content').html($blogContent);
		$('.blog-content').after("<div class='blog-title'><h3>" + lastEntry.title +
									" <small>" + lastEntry.publishedDate.split(" ").slice(0,4).join(" ") +
									"</small></h3>" + "<h4><a href='" + lastEntry.link + 
									"'> read more...</a></h4></div>");
		console.log(lastEntry);

	}, function() {
		$('.blog-content').html(
			"<p>Can't load blog content. View more posts here: " +
			"<a href='http://astrosynergistics.blogspot.com'>Astrosynergistics</a></p>"
			);
	});
});