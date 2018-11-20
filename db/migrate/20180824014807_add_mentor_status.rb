class AddMentorStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_mentor, :boolean
  end
end
