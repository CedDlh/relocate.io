class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_authorized, only: [:my_requests]

  def index
    @search_one = policy_scope(User).search_buddy(params[:user][:plz])
    @search_two = policy_scope(User).search_buddy(params[:user][:specialties])
    @search_three = policy_scope(User).search_buddy(params[:user][:date]) # "2018-11-01"
    @buddies = @search_one & @search_two
    @buddies = @buddies.select { |user| user.buddy? }
    @buddy = @buddies.sample
    @title = "We found #{@buddies.size} #{'Buddy'.pluralize(@buddies.size)} for you"
    # raise
  end

  def show
    @buddy = User.find(params[:id])
    @chatroom = ChatRoom.create
    authorize @buddy

    # @buddy = User.where.not(latitude: nil, longitude: nil)

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


end
