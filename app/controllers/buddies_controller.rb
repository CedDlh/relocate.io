class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:my_requests]

  def index
    @buddies = buddies_search
    @buddies = @buddies.select { |user| user.buddy? }
    create_requests(@buddies, current_user)
    @buddy = @buddies.sample
    @title = "We found #{@buddies.size} #{'Buddy'.pluralize(@buddies.size)} for you"
    # raise
  end

  def show
    @buddy = User.find(params[:id])
    @chatroom = ChatRoom.create
    authorize @buddy
    # @buddy = User.where.not(latitude: nil, longitude: nil)
    if user_signed_in?
      @request = Request.find_by(buddy_id: @buddy.id, user_id: current_user.id, status: "Waiting")
      @next_match = next_match
    else
      @next_match = 0
    end
    @markers = [
      {
        lng: @buddy.longitude,
        lat: @buddy.latitude
      }
    ]
    # @buddies = User.where.not(latitude: nil, longitude: nil)

    # @markers = @buddies.map do |buddy|
    #   {
    #     lng: buddy.longitude,
    #     lat: buddy.latitude
    #   }
    # end
  end

  def my_requests
    @requests = policy_scope(Request.where(buddy_id: current_user.id))
  end

  def next_match
    Request.find_by(buddy_id: params[:id], user_id: current_user.id, status: "Waiting").destroy
    next_match = Request.where(user_id: current_user.id, status: "Waiting").sample
    if next_match
      return next_match.buddy_id
    else
      return 0
    end
  end

  def buddies_search
    search_one = policy_scope(User).search_buddy(params[:user][:plz])
    search_two = policy_scope(User).search_buddy(params[:user][:specialties])
    search_three = policy_scope(User).search_buddy(params[:user][:date])
    return search_one & search_two
  end

  def create_requests(buddies, user)
    if user
      buddies.each do |buddy|
        Request.create!(status: "Waiting", buddy_id: buddy.id, user_id: user.id)
      end
    end
  end
end
