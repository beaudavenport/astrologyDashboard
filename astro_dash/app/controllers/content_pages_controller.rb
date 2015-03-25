class ContentPagesController < ApplicationController
  
  def show
    @content_pages = ContentPage.where(:category => params[:name]).all
  end
  
  def index
    @content_pages = ContentPage.find(:all, category: params[:name])
  end
  
end
