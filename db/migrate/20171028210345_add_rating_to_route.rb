class AddRatingToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :rating, :float
  end
end
