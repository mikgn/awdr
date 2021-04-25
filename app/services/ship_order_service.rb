require 'envio'

class ShipOrderService
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def call
    ship!
  end

  private

  def ship!
    shipping_result = Envio.make_shipping(order)
    raise shipping_result.error unless shipping_result.succeeded?

    order.update(status: 2)
    OrderMailer.shipped(order).deliver_later
  end
end
