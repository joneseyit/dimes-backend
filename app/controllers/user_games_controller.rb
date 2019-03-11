class UserGamesController < ApplicationController
    def index
        @user_games = UserGame.all
        render json: @user_games
    end

    def create
        @user_game = UserGame.new(user_game_params)
        if @user_game.save
            render json: @user_game.game.to_json(:include => :users), status: :created
        else
            render json: { error: "Couldn't join you to the game - You may have already joined" }, status: :not_acceptable
        end
    end

    private
    def user_game_params
        params.require(:user_game).permit(:user_id, :game_id)
    end
end
