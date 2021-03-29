require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup do
    # @cart_with_mac = carts(:one)
    # @macbook = products(:macbook)
    # @ipad =  products(:ipad)

    @cart_one = carts(:one)
    @cart_two = carts(:two)
    @cart_three = carts(:three)

    puts '*******************************************'
    puts "@cart_one: #{@cart_one.line_items.map(&:product_id)}"
    puts "@cart_two: #{@cart_two.line_items.map(&:product_id)}"
    puts "@cart_three: #{@cart_three.line_items.map(&:product_id)}"
    puts '*******************************************'

    sleep
  end

  test 'should create LineItem' do
    @cart_with_mac.add_product(@ipad)

    assert_difference(@cart_with_mac.line_items.count, 1)
  end

  test 'should add +1 quantity WITHOUT creating LineItem' do
    @cart_with_mac.add_product(@macbook)

    assert_difference(@cart_with_mac.line_items.count, 0)
  end
end
