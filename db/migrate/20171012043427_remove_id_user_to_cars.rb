class RemoveIdUserToCars < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :id_user
  end
end
