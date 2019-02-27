class PatientsController < ApplicationController
  before_action :set_user
  before_action :set_patient, only: [ :show, :edit, :update, :destroy]
  
  def index
  @user = current_user.first_time
    if @user == nil
        current_user[:first_time] = false
      @patient = Patient.new
    else 
      binding.pry
      redirect_to patients_path(@patient)
    end
    @patient = current_user.patients.all
  end

  def show
  end
  
  def new
    @patient = Patient.new
  end

  def create
    @patient = current_user.patients.new(the_params)
    if @patient.save
      redirect_to patients_path(@patient)
    else 
      render :new
  end
end

  def edit
  end

  def update
    if @patient.update(the_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to root_path
  end

  private
   def set_patient
    @patient = Patient.find(params[:id])
   end

   def the_params
    params.require(:patient).permit(:name, :admin)
   end
   def set_user
    @user = current_user
  end
end
