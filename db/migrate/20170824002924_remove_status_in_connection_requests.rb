class ChangeStringToBooleanInConnectionRequest < ActiveRecord::Migration[5.0]
  def change
    remove_column :connection_requests, :status
  end
end
