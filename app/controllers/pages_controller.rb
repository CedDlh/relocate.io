class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @user = User.new
    @specialties = ["Anmeldung", "Bank Account", "Tax advise"]
    @title = "RELOCATE TO BERLIN"
    @subtitle = "Find a BUDDY to relocate & onboard you to Berlin"
  end

  def search
    # raise
  end

  def my_tasks
    @requests = policy_scope(Request.where(user_id: current_user.id).where.not(status: "Waiting"))
  end

  def my_messages
    # @chats = Message.where(user_id: current_user.id).map { |m| [] << m.chat_room }.flatten.uniq
    if current_user.buddy
      @chats = ChatRoom.where(buddy_id: current_user.id) && ChatRoom.where(user_id: current_user.id)
    else
      @chats = ChatRoom.where(user_id: current_user.id)
    end
    set_chat_room
    if @chat_room
      current_user.buddy ? @buddy = User.find(@chat_room.buddy_id) : @buddy = User.find(@chat_room.user_id)
    else
      @chat_room = nil
    end
    # raise
  end

  def set_chat_room
    if params[:id]
      @chat_room = ChatRoom.find(params[:id])
    else
      @chat_room = @chats[0]
    end
  end
end
