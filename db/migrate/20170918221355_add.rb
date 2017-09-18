class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :connection_requests, :status, :boolean
  end
end
