class RenamePlayerIdToUserIdInInvitations < ActiveRecord::Migration[5.2]
  def up 
    rename_column :invitations, :player_id, :user_id
  end

  def down
    rename_column :invitations, :user_id, :player_id
  end
end
