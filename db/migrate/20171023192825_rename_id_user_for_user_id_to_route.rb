class RenameIdUserForUserIdToRoute < ActiveRecord::Migration[5.1]
  def change
    rename_column :routes, :id_user, :user_id
  end
end
