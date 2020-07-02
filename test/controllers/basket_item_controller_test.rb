require 'test_helper'

class BasketItemControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get basket_item_add_url
    assert_response :success
  end

end
