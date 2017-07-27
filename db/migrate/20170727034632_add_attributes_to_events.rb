class AddAttributesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :host_id, :integer
    add_column :events, :title, :string
    add_column :events, :photo, :string
    add_column :events, :date, :datetime
    add_column :events, :ticket_link, :string
    add_column :events, :about, :text
  end
end
