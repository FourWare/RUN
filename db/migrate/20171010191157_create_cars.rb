class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :placa
      t.string :tipo
      t.string :modelo
      t.string :color
      t.integer :capacidad

      t.timestamps
      self.primary_key = "placa"
    end
  end
end
