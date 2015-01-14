class Admin::OrdersController < ApplicationController
  
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
  
  def show
    @order = Order.find(params[:id])
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
  
  private
    def order_params
      params.require(:order).permit(:name, :description, :price)
    end
end
