class AddStatusToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :status, :string
    add_column :events, :string, :string
  end
end
