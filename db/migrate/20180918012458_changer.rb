class Changer < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :superuser, :superadmin 
  end
end
