require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "invitations index should return success" do
    get '/invitations'
    assert_response :success
  end
end
