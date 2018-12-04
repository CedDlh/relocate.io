class ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    @buddy = @chat_room.other_user(current_user)
    authorize @chat_room
    respond_to do |format|
      format.html
      format.js # show.js.erb
    end
  end
end
