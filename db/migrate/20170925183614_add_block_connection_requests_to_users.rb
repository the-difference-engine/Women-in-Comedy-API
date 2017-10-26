class AddBlockConnectionRequestsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :block_connection_requests, :boolean
  end
end
