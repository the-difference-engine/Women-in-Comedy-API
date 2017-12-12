class CreateMeetOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :meet_options do |t|
      t.string :name

      t.timestamps
    end
  end
end
