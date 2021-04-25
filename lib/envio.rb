require 'ostruct'

class Envio
  def self.make_shipping(order)
    raise 'Unknown order' unless order.present?

    Rails.logger.info "Order ##{order.id} | " \
                      'Processing shipping to: ' +
                      order.address

    sleep 30 unless Rails.env.test?
    Rails.logger.info '=== The order has been sent ==='
    OpenStruct.new(succeeded?: true)
  end
end
