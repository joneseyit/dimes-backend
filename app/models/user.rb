class User < ApplicationRecord
    has_secure_password
    has_one_attached :img

    has_many :user_games
    has_many :games, through: :user_games
    has_many :invitations
    has_many :inviteds, class_name: "Invitation", foreign_key: "invited_id"
    validates :username, uniqueness: { case_sensitive: false }
  
end
