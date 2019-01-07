class AddSuperAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :superadmin, :boolean
  end
end
