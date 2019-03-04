class Invitation < ApplicationRecord
    belongs_to :user
    belongs_to :invited, className: "User"
    belongs_to :game

    validates :invited_id, uniqueness: {scope: :game_id}
end
