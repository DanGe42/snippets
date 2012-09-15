require 'test_helper'

class TagstosnipsControllerTest < ActionController::TestCase
  setup do
    @tagstosnip = tagstosnips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tagstosnips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tagstosnip" do
    assert_difference('Tagstosnip.count') do
      post :create, tagstosnip: {  }
    end

    assert_redirected_to tagstosnip_path(assigns(:tagstosnip))
  end

  test "should show tagstosnip" do
    get :show, id: @tagstosnip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tagstosnip
    assert_response :success
  end

  test "should update tagstosnip" do
    put :update, id: @tagstosnip, tagstosnip: {  }
    assert_redirected_to tagstosnip_path(assigns(:tagstosnip))
  end

  test "should destroy tagstosnip" do
    assert_difference('Tagstosnip.count', -1) do
      delete :destroy, id: @tagstosnip
    end

    assert_redirected_to tagstosnips_path
  end
end
