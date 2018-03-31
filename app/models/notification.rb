class Notification < ApplicationRecord
  belongs_to :user
	belongs_to :recipient, class_name: "User"

	# after_commit -> { NotificationRelayJob.perform_later(self) }

end
