class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
  belongs_to :cart, optional: true

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def total_price
    price.to_f * quantity
  end

  def update_quantity(quantity_action)
    if quantity_action == 'increment'
      self.quantity += 1
    elsif quantity_action == 'decrement'
      self.quantity -= 1
    end
  end
end
