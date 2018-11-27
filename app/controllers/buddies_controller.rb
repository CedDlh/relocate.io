class BuddiesController < ApplicationController
  def index
    # @buddies = policy_scope(User).where(buddy: true, params)
    @buddies = policy_scope(User).search_buddy(params)
  end

  def show
    @buddy = User.find(id: params[:id])
    authorize @buddy
  end
end
