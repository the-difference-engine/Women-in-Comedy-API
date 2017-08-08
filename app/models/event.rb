class Event < ApplicationRecord
  belongs_to :user
  has_many :posts, as: :postable
end
