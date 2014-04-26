class MedicinesController < ApplicationController
  before_filter :find_hospital
  before_filter :find_patient
  before_filter :find_medicine, only: [:show, :edit, :update, :destroy]
  def new
    @medicine = @patient.medicines.new
  end

  def create
    @medicine = @patient.medicines.create medicine_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def show
    @medicines = @patient.medicines
  end

  def edit
  end

  def update
    @medicine.update_attributes medicine_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end 

  def destroy
    @medicine.delete
    redirect_to hospital_patient_path(@hospital, @patient)
  end


  private
    def medicine_params
    params.require(:medicine).permit(:name, :strength)
    end 

    def find_patient
      @patient = Patient.find params[:patient_id]
    end

    def find_medicine
      @medicine = Medicine.find params[:id]
    end 

     def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end
end
