class CreateConnectionRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :connection_requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :status

      t.timestamps
    end
  end
end
