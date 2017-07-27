class AddAttributesToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :commenter_id, :integer
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
    add_column :comments, :body, :text
  end
end
