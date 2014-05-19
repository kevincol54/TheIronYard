class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_location
  before_filter :find_course
  before_filter :find_assignment
  before_filter :find_submission, only: [:show,
    :update,
    :edit,
    :destroy,
    :reviewing,
    :incomplete,
    :complete,
    :new_comment,
    :add_comment]

  def new
    @submission = Submission.new
  end

  def create
    @submission = @assignment.submissions.create submission_params.merge(user_id: current_user.id, user_name: current_user.name)
    success = @submission.save
    if success == true
      flash[:notice] = "You entered an acceptable submission"
      redirect_to location_course_assignment_path(@location, @course, @assignment)
    else
      flash[:error] = "Not an acceptable submission"
      redirect_to location_course_assignment_path(@location, @course, @assignment)
    end
  end

  def show
    @links = @submission.links
    @comment = @submission.comments
  end

  def edit
  end

  def update
    @submission.update_attributes submission_params
    redirect_to location_course_assignment_submission_path(@location, @course, @assignment, @submission)
  end

  def destroy
  end

  def reviewing
    @submission.reviewing!
    respond_to do |format|
      format.js
    end
  end

  def incomplete
    @submission.incomplete!
    respond_to do |format|
      format.js
    end
  end

  def complete
    @submission.complete!
    respond_to do |format|
      format.js
    end
  end

  # def new_comment
  #   @comment = @submission.comments.new
  # end

  def add_comment
    @comment = @submission.comments.create comment_params.merge(user_id: current_user.id, name: current_user.name)

    respond_to do |format|
      format.js
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:links,
      :user_id,
      :assignment_id,
      :workflow_state,
      :name,
      links_attributes: [:links])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_location
    @location = Location.find params[:location_id]
  end

  def find_course
    @course = Course.find params[:course_id]
  end

  def find_assignment
    @assignment = Assignment.find params[:assignment_id]
  end

  def find_submission
    @submission = Submission.find params[:id]
  end

end
