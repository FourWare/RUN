class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :title
      t.string :description
      t.float :from_lat
      t.float :from_lng
      t.float :to_lat
      t.float :to_lng
      t.column :waypoints, :json
      t.datetime :departure
      t.float :cost

      t.timestamps
    end
  end
end
