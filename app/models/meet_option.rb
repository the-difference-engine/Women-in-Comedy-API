class MeetOption < ApplicationRecord
  has_many :meet_options_users
  has_many :users, :through => :meet_options_users
end
