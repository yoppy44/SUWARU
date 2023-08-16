class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @targets = Target.all
  end
  
  def new
    @target = Target.new
  end  

  def create
    @target = Target.new(target_params)
    ride_time_string = params[:target][:ride_time]
    ride_time = Time.parse(ride_time_string) if ride_time_string.present?

    @target.ride_time = ride_time
    if @target.valid?
      @target.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end  
  end  

  def search
    @targets = Target.search(params[:keyword])
    
  end  

  private

  def target_params
    params.require(:target).permit(:targets_name, :clothes, :age, :resemble, :line_name, :station, :ride_time).merge(user_id: current_user.id)
  end
 
end
