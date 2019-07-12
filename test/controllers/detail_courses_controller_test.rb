require 'test_helper'

class DetailCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detail_course = detail_courses(:one)
  end

  test "should get index" do
    get detail_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_detail_course_url
    assert_response :success
  end

  test "should create detail_course" do
    assert_difference('DetailCourse.count') do
      post detail_courses_url, params: { detail_course: { cour_id: @detail_course.cour_id, user_id: @detail_course.user_id } }
    end

    assert_redirected_to detail_course_url(DetailCourse.last)
  end

  test "should show detail_course" do
    get detail_course_url(@detail_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_detail_course_url(@detail_course)
    assert_response :success
  end

  test "should update detail_course" do
    patch detail_course_url(@detail_course), params: { detail_course: { cour_id: @detail_course.cour_id, user_id: @detail_course.user_id } }
    assert_redirected_to detail_course_url(@detail_course)
  end

  test "should destroy detail_course" do
    assert_difference('DetailCourse.count', -1) do
      delete detail_course_url(@detail_course)
    end

    assert_redirected_to detail_courses_url
  end
end
