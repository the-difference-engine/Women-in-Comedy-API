class RenameToMeetOptionUser < ActiveRecord::Migration[5.0]
  def change
    rename_table :meet_options_users, :meet_option_users
  end
end