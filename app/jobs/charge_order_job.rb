class ChargeOrderJob < ApplicationJob
  queue_as :default

  def perform(order, pay_type_params)
    ChargeOrderService.new(order, pay_type_params).call
  end
end
