class AddUserInRouteToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :users_in_route, :string
  end
end
