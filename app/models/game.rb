class Game < ApplicationRecord
    has_many :user_games
    has_many :users, through: :user_games
    has_many :invitations

    validates :title, presence: true
    validates :time, presence: true
    validates :place, presence: true

    def self.future_games
        Game.all.where('time > ?', DateTime.now)
    end

end
