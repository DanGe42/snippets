require 'test_helper'

class SnippetTagsControllerTest < ActionController::TestCase
  setup do
    @snippet_tag = snippet_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snippet_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snippet_tag" do
    assert_difference('SnippetTag.count') do
      post :create, snippet_tag: {  }
    end

    assert_redirected_to snippet_tag_path(assigns(:snippet_tag))
  end

  test "should show snippet_tag" do
    get :show, id: @snippet_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snippet_tag
    assert_response :success
  end

  test "should update snippet_tag" do
    put :update, id: @snippet_tag, snippet_tag: {  }
    assert_redirected_to snippet_tag_path(assigns(:snippet_tag))
  end

  test "should destroy snippet_tag" do
    assert_difference('SnippetTag.count', -1) do
      delete :destroy, id: @snippet_tag
    end

    assert_redirected_to snippet_tags_path
  end
end
