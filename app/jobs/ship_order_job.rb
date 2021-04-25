class ShipOrderJob < ApplicationJob
  queue_as :default

  def perform(order)
    ShipOrderService.new(order).call
  end
end
