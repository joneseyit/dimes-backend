class UsersController < ApplicationController
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


    def index
        @users = User.all
        render json: @users.to_json(:methods => :invite_format )
    end

    def create
        
        @user = User.new(user_params)
        @user.avatar = url_for(@user.img)
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user_id: @user.id, token: @token, user: @user.to_json(:include => :games) }, status: :created
        else
            render json: { errors: "User could not be created." }, status: :not_acceptable
        end
    end

    def show
        #include the games, as well as inviteds.  From inviteds we want the 
        #username of the person sending the invite, and the title of the game
        @user = User.find(params[:id])
        render json: @user.to_json(:include => :games, :methods => :current_invites)


    end

    private

    def user_params
        params.permit(:name, :username, :email, :password, :avatar, :img, :bio)
    end

end
