class AddIdUserFieldToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :id_user, :integer
  end
end
