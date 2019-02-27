class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy]
  def index
    @appointments = current_user.appointments.all
  end

  def show
  end
  
  def new
    @appointment = current_user.physician.appointments.new
  end

  def create
    @appointment = current_user.physician.apppointments.new(the_params)
    if @appointment.save
      redirect_to root_path
    else 
      render :new
  end
end
  def edit
  end

  def update
    if @appointment.update(the_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to root_path
  end

  private
   def set_appointment
    @appointment = current_user.appointments.find(params[:id])
   end

   def the_params
    params.require(:appointment).permit(:name)
   end
end
