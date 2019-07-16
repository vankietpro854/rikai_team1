require "application_system_test_case"

class SuportsTest < ApplicationSystemTestCase
  setup do
    @suport = suports(:one)
  end

  test "visiting the index" do
    visit suports_url
    assert_selector "h1", text: "Suports"
  end

  test "creating a Suport" do
    visit suports_url
    click_on "New Suport"

    fill_in "Emai", with: @suport.emai
    fill_in "Message", with: @suport.message
    fill_in "Name", with: @suport.name
    fill_in "Subject", with: @suport.subject
    click_on "Create Suport"

    assert_text "Suport was successfully created"
    click_on "Back"
  end

  test "updating a Suport" do
    visit suports_url
    click_on "Edit", match: :first

    fill_in "Emai", with: @suport.emai
    fill_in "Message", with: @suport.message
    fill_in "Name", with: @suport.name
    fill_in "Subject", with: @suport.subject
    click_on "Update Suport"

    assert_text "Suport was successfully updated"
    click_on "Back"
  end

  test "destroying a Suport" do
    visit suports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Suport was successfully destroyed"
  end
end
