require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get checkout_add_url
    assert_response :success
  end

end
