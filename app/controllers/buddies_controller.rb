class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:my_requests]

  def index
    @buddies = buddies_search
    @buddies = @buddies.select { |user| user.buddy? }
    create_requests(@buddies, current_user)
    @buddy = @buddies.sample
    @title = "We found #{@buddies.size} #{'Buddy'.pluralize(@buddies.size)} for you"
  end

  def show
    @buddy = User.find(params[:id])
    if user_signed_in?
      @current_user_chatrooms = []
      Message.where(user: current_user).each { |message| @current_user_chatrooms << message.chat_room  }

      @buddy_chatrooms = []
      Message.where(user: @buddy).each { |message| @buddy_chatrooms << message.chat_room  }

      chat_room_dual = (@current_user_chatrooms & @buddy_chatrooms).uniq

      @chat_room = chat_room_dual[0]
      @chat_room = ChatRoom.create!(buddy_id: @buddy.id, user_id: current_user.id) if @chat_room.nil?
      authorize @chat_room
    end
    authorize @buddy
    set_next_match
    @marker = { lng: @buddy.longitude, lat: @buddy.latitude }
  end

  def my_requests
    @requests = policy_scope(Request.where(buddy_id: current_user.id))
  end

  def set_next_match
    if user_signed_in?
      @request = Request.find_by(buddy_id: @buddy.id, user_id: current_user.id, status: "Waiting")
      @next_match = next_match
    else
      @next_match = -1
    end
  end

  def next_match
    request = Request.find_by(buddy_id: params[:id], user_id: current_user.id, status: "Waiting")
    request&.destroy
    next_match = Request.where(user_id: current_user.id, status: "Waiting").sample
    return next_match.buddy_id if next_match

    return 0
  end

  def buddies_search
    search_one = policy_scope(User).search_buddy(params[:user][:plz])
    search_two = policy_scope(User).search_buddy(params[:user][:specialties])
    # search_three = policy_scope(User).search_buddy(params[:user][:date])
    return search_one & search_two
  end

  def create_requests(buddies, user)
    if user
      buddies.each do |buddy|
        Request.create!(status: "Waiting", buddy_id: buddy.id, user_id: user.id, date: params[:user][:availability] )
      end
    end
  end
end
