class Admin::ContentPagesController < AdminController
  
  def index
    @content_pages = ContentPage.all
  end
  
  def new
    @content_page = ContentPage.new
  end
  
  def create
    @content_page = ContentPage.new(content_page_params)
    
    if @content_page.save
      redirect_to [:admin, @content_page]
    else
      render 'new'
    end
    
  end
  
  def show
    @content_page = ContentPage.find(params[:id])
  end
  
  def edit
    @content_page = ContentPage.find(params[:id])
  end
  
  def update
    @content_page = ContentPage.find(params[:id])
   
    if @content_page.update(content_page_params)
      redirect_to [:admin, @content_page]
    else
      render 'edit'
    end
  end
  
  def destroy
    @content_page = ContentPage.find(params[:id])
    @content_page.destroy
    
    redirect_to admin_content_pages_path
  end
  
  private
    def content_page_params
      params.require(:content_page).permit(:heading, :body, :category)
    end
end
