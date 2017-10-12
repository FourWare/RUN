class AddCarToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :car, :string
  end
end
