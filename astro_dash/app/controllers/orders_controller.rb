class OrdersController < ApplicationController
  
  def new
    if @service.nil?
      @service = Service.find(params[:service_id])
    end
    @order = Order.new(:service => @service)
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render new
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:customer, :customer_info, :email, :service_id)
    end
  
end
