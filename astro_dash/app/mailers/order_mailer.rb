class OrderMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def confirmation_email(order)
    @order = order
    mail(to: order.email, subject: 'Thank you for your order!')
  end
    
end
