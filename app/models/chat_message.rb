class ChatMessage < ApplicationRecord
  belongs_to :user, class_name :User, foreign_key: 'user_id'
  belongs_to :conversation
  after_create_commit do
    ChatMessageCreationEventBroadcastJob.perform_later(self)
  end
end
