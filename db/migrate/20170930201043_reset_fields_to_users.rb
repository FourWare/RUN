class ResetFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nick, :string
    remove_column :users, :career, :string
    remove_column :users, :date_of_birth, :datetime
    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
  end
end
