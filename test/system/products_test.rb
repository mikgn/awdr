require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Image url", with: @product.image_url
    fill_in "Description", with: @product.description
    fill_in "Price", with: @product.price
    fill_in "Title", with: 'Fake Mac'
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Image url", with: @product.image_url
    fill_in "Description", with: @product.description
    fill_in "Price", with: @product.price
    fill_in "Title", with: "The Best Gudget in the World"
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  # test "destroying a Product" do
  #   visit products_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Product was successfully destroyed"
  # end

  test 'check routing number field' do
    visit store_index_url

    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector '#order_routing_number'

    select 'Check', from: 'Pay type'

    assert_selector '#order_routing_number'
  end

  test 'check credit card nubmer field' do
    visit store_index_url

    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector '#order_credit_card_number'
    select 'Credit card', from: 'Pay type'

    assert_selector '#order_credit_card_number'
  end

  test 'check purchase order number field' do
    visit store_index_url

    click_on 'Add to Cart', match: :first
    click_on 'Checkout'

    fill_in 'order_name', with: 'Dave Thomas'
    fill_in 'order_address', with: '123 Main Street'
    fill_in 'order_email', with: 'dave@example.com'

    assert_no_selector '#order_po_number'

    select 'Purchase order', from: 'Pay type'

    assert_selector '#order_po_number'
  end
end
