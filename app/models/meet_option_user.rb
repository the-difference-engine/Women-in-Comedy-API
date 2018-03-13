class MeetOptionUser < ActiveRecord
  belongs_to :user
  belongs_to :meet_option
  end