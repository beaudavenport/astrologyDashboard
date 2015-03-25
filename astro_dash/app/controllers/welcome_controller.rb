require 'rss'
require 'open-uri'

class WelcomeController < ApplicationController
  
  def index
    blog_rss_url = APP_CONFIG['rss_url']
    get_rss(blog_rss_url)
  end
  
  private
    def get_rss(rss_url)
      open(rss_url) do |rss|
        @feed = RSS::Parser.parse(rss)
      end
    end
end
