class BuddiesController < ApplicationController
  def index
    # @buddies = User.where(buddy: true, id: params[:id])
  end

  def show
    @buddy = User.find(buddy: true, id: params[:id])
  end
end
