class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { @user, status: :created, jwt: @token }, status: :created
        else
            render json: { error: "User could not be created." }, status: :not_acceptable
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :avatar)
    end

end
