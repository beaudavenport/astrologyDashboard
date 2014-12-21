class ContentPagesController < ApplicationController
  
  def show
    @content_page = ContentPage.find_by category: params[:name]
  end
  
  def index
    @content_page = ContentPage.find_by category: params[:name]
  end
  
end
