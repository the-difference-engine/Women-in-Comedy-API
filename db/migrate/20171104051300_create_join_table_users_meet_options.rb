class CreateJoinTableUsersMeetOptions < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :meet_options do |t|
      # t.index [:user_id, :meet_option_id]
      # t.index [:meet_option_id, :user_id]
    end
  end
end
