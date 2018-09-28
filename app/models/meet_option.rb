class MeetOption < ApplicationRecord
  has_many :meet_option_users, inverse_of: :meet_option
  has_many :users, through: :meet_option_users
end
