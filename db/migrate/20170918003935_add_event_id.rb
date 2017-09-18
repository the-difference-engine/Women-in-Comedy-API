class AddEventId < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :event_id, :integer
  end
end
