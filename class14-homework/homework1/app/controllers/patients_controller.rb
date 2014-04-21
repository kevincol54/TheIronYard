class PatientsController < ApplicationController

  def new
    @patient = Patient.new   
  end

  def create
    @patient = Patient.create patient_params
    redirect_to root_path
  end

  def edit
    @patient = Patient.find params[:id]
  end

  def update
    @patient = Patient.find params[:id]
    @patient.update_attributes patient_params
    redirect_to root_path
  end

  def show
    @patient = Patient.find params[:id]
  end

  def destroy
    @patient = Patient.find params[:id]
    @patient.delete
    redirect_to root_path
  end

  def doctor
    @patient = Patient.find params[:id]
    @patient.doctor!
    redirect_to root_path
  end

  def xrays
    @patient = Patient.find params[:id]
    @patient.xray!
    redirect_to root_path
  end

  def surgery
    @patient = Patient.find params[:id]
    @patient.surgery!
    redirect_to root_path
  end

  def paybill
    @patient = Patient.find params[:id]
    @patient.paybill!
    redirect_to root_path
  end

  def leaving
    @patient = Patient.find params[:id]
    @patient.leaving!
    redirect_to ad_info_patient_path
  end

  def ad_info
    @patient = Patient.find params[:id]
  end

  private
    def patient_params
      params.require(:patient).permit(:name, :address, :phone_number, :ad_info)
    end
end
