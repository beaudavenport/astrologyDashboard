module OrdersHelper
  
  # checks if order is filled, if so, formats date
  def check_order_filled(order)
    order.filled_on.nil? ? "Not filled" : order.filled_on.to_formatted_s(:long)
  end
end
