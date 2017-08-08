class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.string :photo
      t.string :date
      t.text :ticket_link
      t.text :about

      t.timestamps
    end
  end
end
