class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.integer :routes_per_day
      t.integer :users_created_per_day
      t.integer :cars_per_day
      t.integer :bikes_per_day
      t.integer :users_in_routes_per_day

      t.timestamps
    end
  end
end
