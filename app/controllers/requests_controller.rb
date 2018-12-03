class RequestsController < ApplicationController
  def create
    @request = Request.new(user_id: current_user.id, buddy_id: params[:buddy_id], status: "Pending")
    @request.save
    authorize @request
  end

  def update
    @request = Request.find(params[:id])
    @request.status = params[:status]

    authorize @request
    @request.save
    redirect_to my_requests_path
  end

  def destroy
    @request = Request.find(params[:id])
    authorize @request
    @request.destroy
    redirect_to my_tasks_path
  end

  private

  def request_params
    params.require(:request).permit(:status, :buddy_id, :id, :user_id)
  end
end
