class MeetOptionsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :meet_option
end