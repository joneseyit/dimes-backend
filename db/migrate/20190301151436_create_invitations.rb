class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :invited_id
      t.boolean :responded

      t.timestamps
    end
  end
end
