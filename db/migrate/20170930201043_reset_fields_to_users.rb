class ResetFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nick, :string
    add_column :users, :career, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
