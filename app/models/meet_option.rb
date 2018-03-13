class MeetOption < ApplicationRecord
  has_many :meet_option_users
  has_many :users, through: :meet_option_users
end