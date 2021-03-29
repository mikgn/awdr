require "test_helper"

class CartTest < ActiveSupport::TestCase
  setup do
    @cart_with_mac = carts(:one)
    @cart_with_ipad = carts(:three)
    @ipad = products(:ipad)
  end

  test 'should create LineItem' do
    @cart_with_mac.add_product(@ipad)

    assert_equal(@cart_with_mac.line_items.size, 2)
  end

  test 'should add +1 quantity WITHOUT creating LineItem' do
    @cart_with_ipad.add_product(@ipad)

    assert_equal(@cart_with_ipad.line_items.size, 1)
  end
end
