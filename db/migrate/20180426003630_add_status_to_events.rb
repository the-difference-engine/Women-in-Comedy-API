class AddStatusToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :is_private, :boolean
  end
end
