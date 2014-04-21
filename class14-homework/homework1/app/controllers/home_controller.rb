class HomeController < ApplicationController
  
  def index
    @patient = Patient.where.not(workflow_state: "leaving")
    @patient_leaving = Patient.where(workflow_state: "leaving")
  end

end
