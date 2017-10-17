class Notification < ApplicationRecord
  belongs_to :user_id, class_name: "User"
	belongs_to :recipient_id, class_name: "User"
	belongs_to :notifiable, polymorphic: true

	# after_commit -> { NotificationRelayJob.perform_later(self) }

end
