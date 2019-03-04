class UserGamesController < ApplicationController
    def index
        @user_games = UserGame.all
        render json: @user_games
    end

    def create
        @user_game = UserGame.new(user_game_params)
        if @user_game.create
            render json: @user_game, status: :created
        else
            render json: { error: "Couldn't join you to the game :( Try again please." }, status: :not_acceptable
        end
    end

    private
    def user_game_params
        params.permit(:player_id, game_id)
    end
end
