require 'test_helper'

class UserGamesControllerTest < ActionDispatch::IntegrationTest
  test "user_games index should return success" do
    get '/user_games'
    assert_response :success
  end
end
