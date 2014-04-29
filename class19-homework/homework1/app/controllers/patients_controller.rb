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
    # @patient = @hospital.patients
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new_doctor
    @doctor = @patient.doctors.new
  end

  def add_doctor
    @doctor = @patient.doctors.create doctor_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def doctor
    @patient = Patient.find params[:id]
    @patient.doctor!
    redirect_to hospital_path(@hospital)
  end

  def xrays
    @patient = Patient.find params[:id]
    @patient.xray!
    redirect_to hospital_path(@hospital)

  end

  def surgery
    @patient = Patient.find params[:id]
    @patient.surgery!
    redirect_to hospital_path(@hospital)

  end

  def paybill
    @patient = Patient.find params[:id]
    @patient.paybill!
    redirect_to hospital_path(@hospital)

  end

  def leaving
    @patient = Patient.find params[:id]
    @patient.leaving!
    redirect_to hospital_path(@hospital)

  end

  def search_names
    @search_names = Patient.search_names params[:q]
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
