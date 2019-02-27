class PhysiciansController < ApplicationController
  before_action :set_user
  before_action :set_physician, only: [ :show, :edit, :update, :destroy]
  def index
    @user = current_user.first_time
    if @user == nil
      @user = current_user.phd
      if @user == true
        current_user[:first_time] = false
      @physician = Physician.new
    else 
      redirect_to patients_path
    end
    @physicians = current_user.physicians.all
  end
end
  def show
  end
  
  def new
    
  end

  def create
    @physician = Physician.new(the_params)
    if @physician.save
      redirect_to @physician
    else 
      render :new
  end
end
  def edit
  end

  def update
    if @physician.update(the_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @physician.destroy
    redirect_to root_path
  end

  private
   def set_physician
    @physician = Physician.find(params[:id])
   end

   def the_params
    params.require(:physician).permit(:name, :user_id)
   end
   def set_user
    @user = current_user
  end
end
