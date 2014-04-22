class HospitalsController < ApplicationController
  before_filter :find_hospital, only: [:show, :edit, :update, :destroy]

  def new
    @hospitals = Hospital.new
  end

  def create
    @hospitals = Hospital.create hospitals_params
    redirect_to root_path
  end

  def show
    @patients = @hospitals.patients
    # @medicines = @hospitals.medicines
  end

  def edit
  end

  def update
  end

  private
    def find_hospital
    @hospitals = Hospital.find params[:id]
  end

    def hospitals_params
    params.require(:hospital).permit(:name, :location, :description)
    end  
end
