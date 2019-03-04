class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :place
      t.string :notes
      t.string :time

      t.timestamps
    end
  end
end
