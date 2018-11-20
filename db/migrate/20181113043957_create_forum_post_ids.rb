class CreateForumPostIds < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_post_ids do |t|
      t.string :title
      t.text :content
      t.integer :userId

      t.timestamps
    end
  end
end
