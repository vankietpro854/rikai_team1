require 'test_helper'

class CoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cour = cours(:one)
    @user = users(:michael)
  end

  test "should get index" do
    get cours_url
    assert_redirected_to login_path
  end

  test "should get new" do
    get new_cour_url
    assert_redirected_to login_path
  end

  test "should create cour" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    assert_difference('Cour.count') do
      post cours_url, params: { cour: { name: @cour.name, content: @cour.content, image_cours: @cour.image_cours, time_learn: @cour.time_learn } }
    end

    assert_redirected_to cour_url(Cour.last)
  end

  test "should show cour" do
    get cour_url(@cour)
    assert_response :success
  end

  test "should get edit" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get edit_cour_url(@cour)
    assert_response :success
  end

  test "should update cour" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    patch cour_url(@cour), params: { cour: { name: @cour.name, content: @cour.content, image_cours: @cour.image_cours, time_learn: @cour.time_learn } }
    assert_redirected_to cour_url(@cour)
  end

  test "should destroy cour" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    assert_difference('Cour.count', -1) do
      delete cour_url(@cour)
    end

    assert_redirected_to cours_url
  end
end
