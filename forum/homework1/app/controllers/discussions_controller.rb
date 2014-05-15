class DiscussionsController < ApplicationController
    before_filter :find_discussion, only: [:show, :update, :edit, :destroy]


  def new
    @discussion = Discussion.new
  end

  def create
      @discussion = Discussion.create discussion_params
    success = @discussion.save
    if success == true
      flash[:notice] = "You entered an acceptable Discussion"
      redirect_to root_path
    else
      flash[:error] = "Not an acceptable Discussion"
      render :new
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

  def music_talk
    @discussion = Discussion.where(discussion_type: "Music")
  end

  def tech_talk
    @discussion = Discussion.where(discussion_type: "Tech")
  end

  def much_talk
    @discussion = Discussion.where(discussion_type: "Music & Tech")
  end

  private
  def find_discussion
    @discussion = Discussion.find params[:id]
  end

  def discussion_params
    params.require(:discussion).permit(:title,
      :content, 
      :discussion_type, 
      :user_id)
  end
end
