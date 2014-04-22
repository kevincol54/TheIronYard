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
    @medicine = Medicine.find params[:id]
  end

  def edit
  end

  def update
  end

  private
    def medicine_params
    params.require(:medicine).permit(:name, :strength)
    end 

    def find_patient
      @patient = Patient.find params[:patient_id]
    end

    def find_medicine
      @medicine = @hospital.patients.medicine.find params[:id]
    end 

     def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end
end
