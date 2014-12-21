require 'rss'
require 'open-uri'

class WelcomeController < ApplicationController
  
  def index
    blog_rss_url = 'http://www.npr.org/rss/rss.php?id=3'
    get_rss(blog_rss_url)
  end
  
  private
    def get_rss(rss_url)
      open(rss_url) do |rss|
        @feed = RSS::Parser.parse(rss)
      end
    end
end
