class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room#{params[:chat_room_id]}"
  end
end
