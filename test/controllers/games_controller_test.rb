require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end

  test "games index should return success" do
    get '/games'
    assert_response :success
  end
end
