class PatientsController < ApplicationController

before_filter :find_patient, only: [:edit, :update, :show, :destroy, :doctor, :xrays, :surgery, :paybill, :leaving, :ad_info]

  def new
    @patient = Patient.new   
  end

  def create
    @patient = Patient.create patient_params
    redirect_to root_path
  end

  def edit
  end

  def update
    @patient.update_attributes patient_params
    redirect_to root_path
  end

  def show
  end

  def destroy
    @patient.delete
    redirect_to root_path
  end

  def doctor
    @patient.doctor!
    redirect_to root_path
  end

  def xrays
    @patient.xray!
    redirect_to root_path
  end

  def surgery
    @patient.surgery!
    redirect_to root_path
  end

  def paybill
    @patient.paybill!
    redirect_to root_path
  end

  def leaving
    @patient.leaving!
    redirect_to ad_info_patient_path
  end

  def ad_info
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :address, :phone_number, :ad_info)
    end

    def find_patient
      @patient = Patient.find params[:id]
    end

end
