json.array! @product.orders do |order|
  json.order_id order.id

  json.total_order_price order.line_items.map(&:total_price).sum
  json.paid_by order.pay_type
  json.name order.name
  json.address order.address
  json.email order.email

  json.line_items order.line_items do |line_item|
    json.title line_item.product.title
    json.quantity line_item.quantity
    json.total_product_price number_to_currency line_item.total_price
  end
end
