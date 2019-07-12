require "application_system_test_case"

class DetailCoursesTest < ApplicationSystemTestCase
  setup do
    @detail_course = detail_courses(:one)
  end

  test "visiting the index" do
    visit detail_courses_url
    assert_selector "h1", text: "Detail Courses"
  end

  test "creating a Detail course" do
    visit detail_courses_url
    click_on "New Detail Course"

    fill_in "Cour", with: @detail_course.cour_id
    fill_in "User", with: @detail_course.user_id
    click_on "Create Detail course"

    assert_text "Detail course was successfully created"
    click_on "Back"
  end

  test "updating a Detail course" do
    visit detail_courses_url
    click_on "Edit", match: :first

    fill_in "Cour", with: @detail_course.cour_id
    fill_in "User", with: @detail_course.user_id
    click_on "Update Detail course"

    assert_text "Detail course was successfully updated"
    click_on "Back"
  end

  test "destroying a Detail course" do
    visit detail_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detail course was successfully destroyed"
  end
end
