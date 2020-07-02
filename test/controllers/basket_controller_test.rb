require 'test_helper'

class BasketControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get basket_add_url
    assert_response :success
  end

end
