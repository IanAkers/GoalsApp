class UserCommentsController < ApplicationController

    def new
      @user_comment = current_user.comments.new
    end

    def create
      @user_comment = current_user.comments.new(comment_params)
      if @user_comment.save
        flash[:notices] = ["Comment Submitted"]
        redirect_to user_url(@user_comment.subject)
      else
        flash[:errors] = @user_comment.errors.full_messages
        render :new
      end
    end


  private

    def comment_params
      params.require(:user_comment).permit(:comment, :subject_ids)
    end
  end
