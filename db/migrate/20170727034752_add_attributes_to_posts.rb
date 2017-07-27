class AddAttributesToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :title, :string
    add_column :posts, :body, :text
  end
end
