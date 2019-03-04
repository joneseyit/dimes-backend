class User < ApplicationRecord
    has_many :user_games
    has_many :games, through: user_games
    has_many :invitations
    has_many : inviteds, className: "User", foreign_key: "invited_id"
end
