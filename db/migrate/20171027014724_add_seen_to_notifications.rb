class AddSeenToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :seen, :datetime
  end
end
