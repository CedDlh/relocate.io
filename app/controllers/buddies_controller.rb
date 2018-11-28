class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @search_one = policy_scope(User).search_buddy(params[:user][:plz])
    @search_two = policy_scope(User).search_buddy(params[:user][:specialties])
    @buddies = @search_one & @search_two
    @buddies = @buddies.select { |user| user.buddy? }
    @buddy = @buddies.sample


    @title = "We found #{@buddies.size} #{'Buddy'.pluralize(@buddies.size)} for you"
    # raise
  end

  def show
    @buddy = User.find(params[:id])
    authorize @buddy
  end



end
