class AddUserAttr < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :about, :text
    add_column :users, :website, :string
    add_column :users, :video_link, :string
    add_column :users, :gender, :string
    add_column :users, :training, :string
    add_column :users, :experience, :string
    add_column :users, :meeting, :text
  end
end
