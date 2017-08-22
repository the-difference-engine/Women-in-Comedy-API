class AddAuthorToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author_id, :integer 
  end
end
