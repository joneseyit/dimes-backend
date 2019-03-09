class GamesController < ApplicationController
    def index
        @games = Game.all
        render json: @games.to_json(:include => :users)
    end

    def create
        @game = Game.new(game_params)
        if @game.create
            render json: @game.to_json(:include => :users), status: :created
        else
            render json: { error: "Game could not be saved." }, status: :not_acceptable
        end
    end

    private

    def game_params
        params.permit(:title, :place, :notes, :time)
    end



end
