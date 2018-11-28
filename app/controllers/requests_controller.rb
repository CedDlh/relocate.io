class RequestsController < ApplicationController
  def create
    @request = Request.new(user_id: current_user.id, buddy_id: params[:buddy_id], status: "Pending")
    @request.save
    authorize @request
  end
end
