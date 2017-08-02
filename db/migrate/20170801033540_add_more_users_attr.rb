class AddMoreUsersAttr < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :birthdate, :string
    
end
