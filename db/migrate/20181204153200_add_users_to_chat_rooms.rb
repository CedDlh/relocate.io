class AddUsersToChatRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :user_id, :integer
    add_column :chat_rooms, :buddy_id, :integer
  end
end
