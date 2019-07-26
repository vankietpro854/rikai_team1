require 'test_helper'

class SuportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suport = suports(:one)
    @user = users(:michael)
  end

  test "should get index" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true'} }
    get suports_url
    assert_response :success
  end

  test "should get new" do
    get suport_new_path
    assert_response :success
  end

  test "should create suport" do
    assert_difference('Suport.count') do
      post suports_url, params: { suport: { name: @suport.name,
                                            emai: @suport.emai, 
                                            subject: @suport.message, 
                                            message: @suport.subject } }
    end

    assert_redirected_to suport_url(Suport.last)
  end

  test "should destroy suport" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true'} }
    assert_difference('Suport.count', -1) do
      delete suport_url(@suport)
    end

    assert_redirected_to suports_url
  end
end
