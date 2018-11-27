class BuddiesController < ApplicationController
  def index
    # @buddies = policy_scope(User).where(buddy: true, params)
    # @search_one = Tool.search_by_location_and_category(params[:location])
    # @search_two = Tool.search_by_location_and_category(params[:category])
    # @buddies = @search_one & @search_two
    @buddies = policy_scope(User).search_buddy(params)
  end

  def show
    @buddy = User.find(id: params[:id])
    authorize @buddy
  end
end
