class RemoveTimeFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :time
  end
end
