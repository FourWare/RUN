class AddMarcaToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :marca, :string
  end
end
