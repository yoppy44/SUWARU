class TargetsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  
  def new
  end  

  def create
    @target = Target.create(target_params)
    Line.create(line_params)
    redirect_to root_path
  end  

  private

  def target_params
    params.permit(:targets_name, :clothes, :age, :resemble).merge(user_id: current_user.id)
  end
  
  def line_params
    params.permit(:line_name, :station, :ride_time).merge(target_id: @target.id)
  end  
end
