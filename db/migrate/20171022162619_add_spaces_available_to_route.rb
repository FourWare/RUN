class AddSpacesAvailableToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :spaces_available, :integer
  end
end
