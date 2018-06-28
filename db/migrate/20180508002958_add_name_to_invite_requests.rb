class AddNameToInviteRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :invite_requests, :event_id, :integer
  end
end
