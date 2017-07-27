class AddAttributesToConnectionRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :connection_requests, :sender_id, :integer
    add_column :connection_requests, :receiver_id, :integer
    add_column :connection_requests, :status, :string
  end
end
