class RemoveCalificacionFromRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :routes, :calificacion, :integer
  end
end
