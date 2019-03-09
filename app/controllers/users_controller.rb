class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        @user.avatar = url_for(@user.img)
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user_id: @user.id, token: @token }, status: :created
        else
            render json: { errors: "User could not be created." }, status: :not_acceptable
        end
    end

    def show
        @user = User.find(params[:id])
        render json: @user.to_json(:include => :games), status: :ok
    end

    private

    def user_params
        params.permit(:name, :username, :email, :password, :avatar, :img, :bio)
    end

end
