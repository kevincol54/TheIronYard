class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_location, only: [:show, :update, :edit, :destroy]

  def index
    authorize! :read, Location
    @location = Location.all
  end

  def new
    authorize! :create, Location
    @location = Location.new
  end

  def create
    authorize! :create, Location
    @location = Location.create location_params
    success = @location.save
    if success == true
      flash[:notice] = "You entered an acceptable Location"
      redirect_to locations_path
    else
      flash[:error] = "Not an acceptable Location"
      render :new
    end
  end

  def show
    authorize! :read, Course
    @course = @location.courses.accessible_by(current_ability)
    # @course = @location.courses
  end

  def edit
  end

  def update
    authorize! :update, Location
    @location.update_attributes location_params
    redirect_to location_path(@location)
  end

  def destroy
  end

  private
    def find_location
      @location = Location.find params[:id]
    end

    def location_params
      params.require(:location).permit(:name)
    end
end
