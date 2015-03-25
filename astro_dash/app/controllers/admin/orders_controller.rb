class Admin::OrdersController < AdminController
  
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.new(order_params)
    
    if @order.save
      redirect_to [:admin, @order]
    else
      render 'new'
    end
    
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
   
    if @order.update(order_params)
      redirect_to [:admin, @order]
    else
      render 'edit'
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    
    redirect_to admin_index_path
  end
  
  # Generate email with link to service documents, update order status
  def send_documents
    @docs = ActiveSupport::JSON.decode(params[:files])
    @order = Order.find(params[:id])
    DocumentMailer.document_email(@docs, @order).deliver
    
    # update filled on date with current date
    @order.filled_on = Date.today
    @order.save
    render :json => @order.filled_on
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :description, :price)
    end
    
end
