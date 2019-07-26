require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get login" do
    get login_path
    assert_response :success
  end

  test "should get logout" do
  	delete logout_path
    assert_redirected_to root_url
  end

end
