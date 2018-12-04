class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    @buddy = User.find(@chat_room.buddy_id)
    authorize @chat_room
    respond_to do |format|
      format.html
      format.js # show.js.erb
    end
  end
end
