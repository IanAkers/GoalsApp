class GoalCommentsController < ApplicationController

  def new
    @goal_comment = current_user.goal_comments_made.new
  end

  def create
    @goal_comment = current_user.goal_comments_made.new(comment_params)
    if @goal_comment.save
      flash[:notices] = ["Comment Submitted"]
      redirect_to user_url(@goal_comment.goal_owner)
    else
      flash[:errors] = @goal_comment.errors.full_messages
      render :new
    end
  end


private

  def comment_params
    params.require(:goal_comment).permit(:comment, :subject_id)
  end
end
