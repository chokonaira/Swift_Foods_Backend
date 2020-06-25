require 'test_helper'

class HotelsRestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get hotels_restaurants_add_url
    assert_response :success
  end

end
