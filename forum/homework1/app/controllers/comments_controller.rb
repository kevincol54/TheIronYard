class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_filter :find_discussion
   def new
    @comment = Comment.new
  end

  def create
    @comment = @discussion.comments.create comment_params.merge(user_id: current_user.id)
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def find_comments
  end

  def comment_params
    params.require(:comment).permit(:content, :discussion_id, :user_id)
  end

  def find_discussion
    @discussion = Discussion.find params[:discussion_id]
  end
end
