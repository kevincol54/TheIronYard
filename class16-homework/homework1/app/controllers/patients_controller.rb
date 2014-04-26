class PatientsController < ApplicationController
  before_filter :find_hospital
  before_filter :find_patient, only: [:show, :edit, :update, :destroy]
  def new
    @patient = @hospital.patients.new   
  end

  def create
    @patient = @hospital.patients.create patient_params
    redirect_to hospital_path(@hospital)
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to hospital_path(@hospital)
  end

  def show
    @patient = Patient.find params[:id]
    @medicine = Medicine.all
    @medicines = @patient.medicines
  end

  def destroy
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to hospital_path(hospital)
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

  private
    def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end

    def find_patient
      @patient = @hospital.patients.find params[:id]
    end

    def patient_params
      params.require(:patient).permit(:name, :address, :phone_number, :hospital_id)
    end
end
