class AddSuspendedBooleanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :suspended, :boolean
  end
end
