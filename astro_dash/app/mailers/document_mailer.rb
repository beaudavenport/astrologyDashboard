class DocumentMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def document_email(docs, order)
    @docs = docs
    @order = order
    mail(to: order.email, subject: 'Your online documents have arrived!')
  end
  
end
