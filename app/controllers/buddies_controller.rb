class BuddiesController < ApplicationController
  def index
    # @buddies = User.where(buddy: true, id: params[:id])
    @buddies = policy_scope(User).order(created_at: :desc)
  end

  def show
    @buddy = User.find(buddy: true, id: params[:id])
    authorize @buddy
  end
end
