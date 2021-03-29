class CombineItemsInCart < ActiveRecord::Migration[6.1]
  def up
    # replace multiple items for a single product in a cart with a
    # single item
    Cart.find_each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        next if quantity < 2

        # remove individual items
        cart.line_items.where(product_id: product_id).delete_all

        # replace with a single item
        item = cart.line_items.build(product_id: product_id)
        item.quantity = quantity
        item.save!
      end
    end
  end

  def down
    LineItem.where('quantity>1').find_each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart.id,
          product_id: line_item.product.id,
          quantity: 1
        )
      end
      line_item.destroy
    end
  end
end
