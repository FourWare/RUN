class RenameCarToRoute < ActiveRecord::Migration[5.1]
  def change
    rename_column :routes, :car, :car_placa
  end
end
