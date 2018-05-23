class Event < ApplicationRecord
  belongs_to :user
  has_many :posts, as: :postable
  has_many :guests
  has_many :invite_requests
  
end
