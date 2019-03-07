require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "users show should return success" do
    user = users(:Jones)
    get :show, params: { id: user.id }
    assert_response :success
  end
end
