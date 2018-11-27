class BuddiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # @buddies = policy_scope(User).where(buddy: true, params)
    # @search_one = buddy.search_by_location_and_category(params[:location])
    # @search_two = buddy.search_by_location_and_category(params[:category])
    # @buddies = @search_one & @search_two
    @buddies = policy_scope(User).search_buddy(params)
  end

  def show
    @buddy = User.find(id: params[:id])
    authorize @buddy
  end

  def new
    @buddy = User.new
    # authorize @buddy
  end

  def create
    @buddy = User.new(buddy_params)
    @buddy.user = current_user
    authorize @buddy
    if @buddy.save
      redirect_to buddy_path(@buddy)
    else
      render :new
    end
  end

  def edit
    @buddy = User.find(params[:id])
  end

  def update
    @buddy = User.find(params[:id])
    @buddy.update(buddy_params)
    redirect_to buddys_path
  end

  def buddy_params
    params.require(:buddy).permit(:first_name, :last_name, :city, :plz,
    :languages, :specialties, :buddy, :photo, :description)
  end
end
