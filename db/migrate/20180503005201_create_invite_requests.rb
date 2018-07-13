class CreateInviteRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :invite_requests do |t|
      t.integer :sender_id 
      t.integer :receiver_id 
      t.boolean  :status
      
      t.timestamps
    end
  end
end
