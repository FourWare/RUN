class AddIdUserToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :id_user, :integer
  end
end
