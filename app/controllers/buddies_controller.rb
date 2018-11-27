class BuddiesController < ApplicationController
  def index
    # @buddies = policy_scope(User).where(buddy: true, params)
    @buddies = policy_scope(User).order(created_at: :desc)
  end

  def show
    @buddy = User.find(id: params[:id])
    authorize @buddy
  end
end
