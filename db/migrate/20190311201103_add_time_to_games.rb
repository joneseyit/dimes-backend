class AddTimeToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :time, :datetime
  end
end
