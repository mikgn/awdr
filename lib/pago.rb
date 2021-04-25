require 'ostruct'

class Pago
  def self.make_payment(order_id:, payment_method:, payment_details:)
    case payment_method
    when :check
      Rails.logger.info "Order ##{order_id} | " \
                        'Processing check: ' +
                        payment_details.fetch(:routing).to_s + '/' +
                        payment_details.fetch(:account).to_s
    when :credit_card
      Rails.logger.info "Order ##{order_id} | " \
                        'Processing credit_card: ' +
                        payment_details.fetch(:cc_num).to_s + '/' +
                        payment_details.fetch(:expiration_month).to_s + '/' +
                        payment_details.fetch(:expiration_year).to_s
    when :po
      Rails.logger.info "Order ##{order_id} | " \
                        'Processing purchase order: ' +
                        payment_details.fetch(:po_num).to_s
    else
      raise "Unknown payment_method #{payment_method}"
    end
    sleep 30 unless Rails.env.test?
    Rails.logger.info '=== Done Processing Payment ==='

    if order_id.even?
      OpenStruct.new(succeeded?: true)
    else
      OpenStruct.new(succeeded?: false)
    end
  end
end
