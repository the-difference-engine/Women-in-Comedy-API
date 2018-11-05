class RemoveChatMessages < ActiveRecord::Migration[5.2]
  def change
    drop_table :chat_messages
  end
end
