class RequestsController < ApplicationController

 def create
    @request = Request.new(params[:user_id, :buddy_id, :specialties, :date])
  end

end
