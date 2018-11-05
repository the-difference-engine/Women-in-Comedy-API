class ChatRoom < ApplicationRecord
  has_many :users
  has_many :chat_messages, dependent: :destroy
end
