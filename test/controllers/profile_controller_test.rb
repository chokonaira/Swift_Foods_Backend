require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get user_profile" do
    get profile_user_profile_url
    assert_response :success
  end

end
