require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test 'received' do
    mail = OrderMailer.received(orders(:one))
    assert_equal 'Depot Store Order Confirmation', mail.subject
    assert_equal ['john_smith@test.com'], mail.to
    assert_equal ['store@depot.com'], mail.from
    assert_match 'Macbook Pro M1', mail.body.encoded
  end

  test 'shipped' do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal 'Depot Store Order Shipped', mail.subject
    assert_equal ['john_smith@test.com'], mail.to
    assert_equal ['store@depot.com'], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Macbook Pro M1<\/td>/, mail.body.encoded
  end
end
