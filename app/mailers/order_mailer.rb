class OrderMailer < ApplicationMailer
  default from: 'store@depot.com'

  def received(order)
    @order = order

    mail to: order.email, subject: 'Depot Store Order Confirmation'
  end

  def payment_failed(order)
    @order = order

    mail to: order.email, subject: 'Payment failed'
  end

  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Depot Store Order Shipped'
  end
end
