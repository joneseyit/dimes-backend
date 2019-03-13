class User < ApplicationRecord
    has_secure_password
    has_one_attached :img

    has_many :user_games
    has_many :games, through: :user_games
    has_many :invitations
    has_many :inviteds, class_name: "Invitation", foreign_key: "invited_id"
    validates :username, uniqueness: { case_sensitive: false }

    def self.all_but_me(id)
        user = User.find(id)
        User.all.reject do |u|
            u == user
        end
    end

    def invite_format
        { key: self.id, value: self.id, text: self.username }
    end

    def current_invites
        self.inviteds.where('responded = ?', false)
    end
end
