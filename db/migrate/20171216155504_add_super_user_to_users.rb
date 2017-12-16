class AddSuperUserToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superuser, :boolean
  end
end
