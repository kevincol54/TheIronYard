class MedicinesController < ApplicationController
  before_filter :find_hospital
  before_filter :find_patient

  def new
    @medicine = Medicine.new
  end
  def create
    @medicine = patient.medicine.create medicine_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
     def find_patient
      @patient = Patient.find params[:patient_id]
    end

    def find_medicine
      @medicine = Medicine.find params[:id]
    end 

     def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end

    def medicine_params
      params.require(:medicine).permit(:name)
    end
end
