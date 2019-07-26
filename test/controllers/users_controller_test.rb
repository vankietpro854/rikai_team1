require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user = users(:michael)
  end

  test "should get index" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get users_url
    assert_response :success
  end

  test "should get new" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get sign_up_path
    assert_response :success
  end

  test "should create user" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    assert_difference('User.count') do
      post user_url(@user), params: { user: {name: @user.name,
                                       email: @user.email,
                                       password_digest: @user.password_digest,
                                       image: @user.image, 
                                       address: @user.address, 
                                       phone: @user.phone,
                                       date: @user.date,
                                       admin: @user.admin } }
    end
    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    patch user_url(@user), params: { user: { name: 'duygnuyen', 
                                email: 'duygnuyen@gmail.com',
                                image: 'MyString', 
                                address: 'MyString', 
                                phone: '0918795236',
                                 date: '19/5/2018'} }
    assert_response :success
  end

  test "should destroy user" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
