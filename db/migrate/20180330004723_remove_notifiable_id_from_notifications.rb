class RemoveNotifiableIdFromNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :notifiable_id
  end
end
