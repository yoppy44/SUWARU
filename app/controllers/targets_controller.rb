class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def new
    @target_line = TargetLine.new
  end  

  def create
    @target_line = TargetLine.new(target_params)
    ride_time_string = params[:target_line][:ride_time]
    ride_time = Time.parse(ride_time_string) if ride_time_string.present?

    @target_line.ride_time = ride_time
    if @target_line.valid?
      @target_line.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end  
  end  

  private

  def target_params
    params.require(:target_line).permit(:targets_name, :clothes, :age, :resemble, :line_name, :station, :ride_time).merge(user_id: current_user.id)
  end
 
end
