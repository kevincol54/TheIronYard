class Hospital < ActiveRecord::Base
  has_many :patients
  has_many :medicines

  # @hospitals = Hospital.all
  accepts_nested_attributes_for :patients
end
