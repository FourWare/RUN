class AddBooleanActivaToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :activa, :boolean
  end
end
