class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    
    def index
        @users = User.all
        render json: @users.to_json(:methods => :invite_format, :except => [:password_digest, :email, :id] )
    end

    def create
        @user = User.new(user_params)
        @user.avatar = url_for(@user.img) if @user.img != ""
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user_id: @user.id, token: @token, user: @user.to_json(:include => :upcoming_games), :except => :password_digest }, status: :created
        else
            render json: { errors: "User could not be created." }, status: :not_acceptable
        end
    end

    # def show
    #     #token decode 
    #     # render json: current_us   er.to_json(....)
    #     @user = User.find(params[:id])
    #     render json: @user.to_json(:methods => [:current_invites, :upcoming_games])
    # end

    def profile 
 
        render json: current_user.to_json(:methods => [:current_invites, :upcoming_games], :except => :password_digest )
    end 

    private

    def user_params
        params.permit(:name, :username, :email, :password, :avatar, :img, :bio, :token)
    end

end

#     render json:     @user.to_json(:include => 
#     [ :games, :inviteds => 
#         { :include => 
#             [
#                 { :user => {
#                         :only => :username
#                             } 
#                 }, :game => {
#                         :only => [:title, :id]
#                 }
#             ] 
#         }
#     ]
# ), status: :ok 