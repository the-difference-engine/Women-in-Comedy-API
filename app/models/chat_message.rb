class ChatMessage < ApplicationRecord
  # belongs_to :user
  after_create_commit do
    ChatMessageCreationEventBroadcastJob.perform_later(self)
  end
end
