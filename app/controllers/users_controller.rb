class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.create
            render json: @user, status: :created
        else
            render json: { error: "User could not be saved." }, status: :not_acceptable
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    private

    def user_params
        params.permit(:name, :username, :email, :password, :avatar)
    end

end
