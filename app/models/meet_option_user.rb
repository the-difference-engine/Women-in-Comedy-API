class MeetOptionUser < ApplicationRecord
  belongs_to :user
  belongs_to :meet_option
  accepts_nested_attributes_for :meet_option
end
