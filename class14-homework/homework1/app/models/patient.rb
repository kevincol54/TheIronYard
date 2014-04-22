class Patient < ActiveRecord::Base

  include Workflow 
  workflow do 
    state :waiting do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :leaving, transitions_to: :leaving
    end

    state :doctor do
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :paybill, transitions_to: :paybill
    end

    state :xray do
      event :surgery, transitions_to: :surgery
      event :doctor, transitions_to: :doctor
      event :paybill, transitions_to: :paybill
    end

    state :surgery do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :paybill, transitions_to: :paybill
    end

    state :paybill do
      event :leaving, transitions_to: :leaving
    end

    state :leaving 
      event :leaving, transitions_to: :leaving
  end

  WAITING = ["Send to Doctor", "Send to Xray", "Send to Surgery", "Leave"]
  DOCTOR = ["Send to Xray", "Send to Surgery", "Paybill"]
  XRAY = ["Send to Surgery", "Send to Doctor", "Paybill"]
  SURGERY = ["Send to Doctor", "Send to Xray", "Paybill"]
  PAYBILL = ["Leave"]
end
