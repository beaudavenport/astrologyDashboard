---
---
$(function() {
	var numberOfParagraphs = {{ site.blog_paragraphs }};
	
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
	
	var renderContent = function(entry, content) {
		$('#blog-content').html(content);
		$('#blog-title').html("<div class='blog-title'><h3>" + entry.title +
									"</h3><small>" + entry.publishedDate.split(" ").slice(0,4).join(" ") +
									"</small></div>"
									);
		$('#blog-footer').html("<div class='blog-title'><small>...continue reading on </small><a href='" + 
									entry.link +
									"'>AstroSynergistics</a><small>, the astrology blog of Nikki Davenport</small></div>"
									);
	}
	
	var renderError = function() {
		$('.blog-content').html(
			"<p>Can't load blog content. View more posts here: " +
			"<a href='http://astrosynergistics.blogspot.com'>Astrosynergistics</a></p>"
			);
	}
	
	parseRSS('https://nikiastro.wordpress.com/feed/', function(feed) {
		var lastEntry = feed.entries[0];
		var $entryContent = $(lastEntry.content);
		var $blogContent= $entryContent.filter("p, ul").slice(0,numberOfParagraphs);
		console.log(lastEntry.content);
		renderContent(lastEntry, $blogContent);
	}, function() {
		renderError();
	});
});
