class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    price.to_f * quantity
  end
end
