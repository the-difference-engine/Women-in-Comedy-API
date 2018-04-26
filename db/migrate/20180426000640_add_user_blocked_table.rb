class AddUserBlockedTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user_blocks do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
