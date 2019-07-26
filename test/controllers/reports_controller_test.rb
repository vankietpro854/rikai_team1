require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
    @user = users(:michael)
  end

  test "should get index" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    assert_difference('Report.count') do
      post reports_url, params: { report: { content: @report.content, title: @report.title, user_id: @report.user_id } }
    end
    assert_redirected_to report_url(Report.last)
  end

  test "should show report" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password'} }
    get edit_report_url(@report)
    assert_response :success
  end 

  test "should update report" do
    patch report_url(@report), params: { report: { content: @report.content, title: @report.title, user_id: @report.user_id } }
    assert_redirected_to report_url(@report)
  end

  test "should destroy report" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password'} }
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_url
  end
end
