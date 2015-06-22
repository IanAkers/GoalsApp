class GoalsController < ApplicationController
  before_action :require_signed_in

  def index
    render :index
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.goal_status = "Not Completed"
    if @goal.save
      redirect_to goals_url
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:notices] = ["Goal Updated"]
      redirect_to goals_url
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:content, :goal_type, :goal_status)
  end
end
