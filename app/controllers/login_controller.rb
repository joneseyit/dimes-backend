class LoginController < ApplicationController
    def create
        @user = User.find_by(username: user_login_params[:username])
        #authenticate takes in the password from brcypt and converts it to a hash?
    
        if @user && @user.authenticate(user_login_params[:password])
            token = encode_token({ user_id: @user.id })
            render json: { user_id: @user.id, token: token, user: @user.to_json(:include => :upcoming_games) }, status: :accepted
        else
            render json: { errors: 'Nice Brick :)  Invalid username or password.  Please try again.' }, status: :unauthorized
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end