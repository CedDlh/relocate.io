class AppointmentsController < ApplicationController

  def my_appointments
  end

  def create
  @appointment = Appointment.new(appoint_params)
  @buddy = User.find(params[:buddy_id])
  @appointment.buddy = @buddy
  @appointment.user = current_user
  authorize @buddy

   if @appointment.save
      redirect_to my_appointments_path
    else
      redirect_to buddy_path(@buddy)
    end

  end

   def update
    @buddy = User.find(params[:buddy_id])
    @appointment.update(appoint_params)
    redirect_to my_appointments_path
    end

  # def destroy
  #   @appointment = Appointment.find(params[:id])
  #   @appointment.destroy
  #   redirect_to my_tasks_path
  # end


  private

  def appoint_params
    params.require(:appointment).permit(:kind, :buddy_id, :user_id)
  end
end
