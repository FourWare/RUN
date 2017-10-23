class RenameUserIdForIdUserToRoute < ActiveRecord::Migration[5.1]
  def change
    rename_column :routes, :user_id, :id_user
  end
end
