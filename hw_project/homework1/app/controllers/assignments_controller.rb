class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_location
  before_filter :find_course
  before_filter :find_assignment, only: [:show,
    :update,
    :edit,
    :destroy,
    :new_comment,
    :add_comment]

  def index
  end

  def new
    authorize! :create, Assignment
    @assignment = Assignment.new
  end

  def create
    authorize! :create, Assignment
    @assignment = @course.assignments.create assignment_params
    success = @assignment.save
    if success == true
      flash[:notice] = "You entered an acceptable assignment"
      redirect_to location_course_assignment_path(@location, @course, @assignment)
    else
      flash[:error] = "Not an acceptable assignment"
      render :new
    end
  end

  def show
    authorize! :read, Assignment
    authorize! :read, Submission
    @submission = @assignment.submissions.accessible_by(current_ability, :read).where.not(workflow_state: "complete")
    # @submission = @assignment.submissions.where.not(workflow_state: "complete")
    # authorize! :read, Comment
    # @submission = @assignment.submissions
    @comment = @assignment.comments
  end

  def edit
    authorize! :update, Assignment
  end

  def update
    authorize! :update, Assignment
    @assignment.update_attributes assignment_params
    redirect_to location_course_assignment_path(@location, @course, @assignment)
  end

  def destroy
  end

  def new_comment
    @comment = Comment.new
  end

  def add_comment
    @comment = @assignment.comments.create comment_params.merge(user_id: current_user.id, name: current_user.name)

    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def assignment_params
    params.require(:assignment).permit(:name, :description, :course_id)
  end

  def find_location
    @location = Location.find params[:location_id]
  end

  def find_course
    @course = Course.find params[:course_id]
  end

  def find_assignment
    @assignment = Assignment.find params[:id]
  end
end
