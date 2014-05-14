class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_location
  before_filter :find_course, only: [:show, :update, :edit, :destroy]

  def new
    authorize! :create, Course
    @course = Course.new
  end

  def create
    authorize! :create, Course
    @course = @location.courses.create course_params
    success = @course.save
    if success == true
      flash[:notice] = "You entered an acceptable Course"
      redirect_to location_path(@location)
    else
      flash[:error] = "Not an acceptable Course"
      render :new
    end
  end

  def show
    authorize! :read, Assignment
    @assignment = @course.assignments
  end

  def edit
    authorize! :update, Course
  end

  def update
    authorize! :update, Course
    @course.update_attributes course_params
    redirect_to location_course_path(@location, @course)
  end

  def destroy
  end

  private
    def find_location
      @location = Location.find params[:location_id]
    end
    
    def find_course
      @course = Course.find params[:id]
    end

    def course_params
      params.require(:course).permit(:name, :location_id)
    end
end
