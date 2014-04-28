class PatientsController < ApplicationController
  before_filter :find_hospital
  before_filter :find_patient, only:[:show,
    :edit,
    :update,
    :destroy,
    :doctor,
    :add_doctor]
  def new
    @patient = Patient.new 
    @hospitals = Hospital.all
  end

  def create
    @patient = Patient.create patient_params
    redirect_to root_path
  end

  def show
    @doctor = @patient.doctors
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def doctor
    @doctor = @patient.doctors.new
  end

  def add_doctor
    @doctor = @patient.doctors.create doctor_params
    redirect_to root_path
  end
  
  private
    def patient_params
      params.require(:patient).permit(:name,
        :address,
        :phone,
        :description,
        :hospital_id,
        {hospital_ids: []})
    end
    def doctor_params
      params.require(:doctor).permit(:name)
    end
    def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end
    def find_patient
      @patient = Patient.find params[:id]
    end
end
