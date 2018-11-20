class AddUseidToForumPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :forum_posts, :userId, :integer
  end
end
