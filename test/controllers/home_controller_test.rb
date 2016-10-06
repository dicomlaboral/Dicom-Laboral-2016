require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get usercompanies" do
    get :usercompanies
    assert_response :success
  end

end
