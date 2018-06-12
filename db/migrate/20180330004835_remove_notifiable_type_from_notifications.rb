class RemoveNotifiableTypeFromNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :notifiable_type
  end
end
