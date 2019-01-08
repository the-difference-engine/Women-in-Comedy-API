class Changer < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :superadmin 
  end
end
