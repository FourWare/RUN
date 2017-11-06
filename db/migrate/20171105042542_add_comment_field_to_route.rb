class AddCommentFieldToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :comments, :string
  end
end
