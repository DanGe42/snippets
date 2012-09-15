require 'test_helper'

class SnippetControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
