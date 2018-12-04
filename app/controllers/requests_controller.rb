class RequestsController < ApplicationController
  def create
    require "date"

    date_array = params[:date].split("-")
    date = Date.new(date_array[2].to_i, date_array[1].to_i, date_array[0].to_i)
    @request = Request.new(user_id: current_user.id, buddy_id: params[:buddy_id], status: "Pending", date: date )
    @request.save
    authorize @request
    redirect_to my_tasks_path(current_user)
    flash[:notice] = "Your request has been sent"
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
    params.require(:request).permit(:status, :buddy_id, :id, :user_id, :availabilty)
  end
end
