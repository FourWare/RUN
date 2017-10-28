class AddCalificacionToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :calificacion, :integer
  end
end
