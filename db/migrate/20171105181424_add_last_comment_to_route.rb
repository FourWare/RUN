class AddLastCommentToRoute < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :last_comment, :string
  end
end
