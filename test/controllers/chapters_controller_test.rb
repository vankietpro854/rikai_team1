require 'test_helper'

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chapter = chapters(:one)
    @user = users(:michael)
  end

  test "should get index" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get chapters_url
    assert_response :success
  end

  test "should get new" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get new_chapter_url
    assert_response :success
  end

  test "should create chapter" do
      assert_difference('Chapter.count') do
      post chapters_url, params: { chapter: {name: @chapter.name, content: @chapter.content, cour_id: @chapter.cour_id } }
    end

    assert_redirected_to chapter_url(Chapter.last)
  end

  test "should get edit" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    get edit_chapter_url(@chapter)
    assert_response :success
  end

  test "should update chapter" do
    patch chapter_url(@chapter), params: { chapter: {name: @chapter.name, content: @chapter.content, cour_id: @chapter.cour_id} }
    assert_redirected_to chapter_url(@chapter)
  end

  test "should destroy chapter" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password', admin: 'true' } }
    assert_difference('Chapter.count', -1) do
      delete chapter_url(@chapter)
    end

    assert_redirected_to chapters_url
  end
end
