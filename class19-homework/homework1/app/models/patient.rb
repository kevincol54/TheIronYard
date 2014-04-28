class Patient < ActiveRecord::Base
  has_many :join_tables
  has_many :hospitals, through: :join_tables
  has_many :doctors, as: :treatable
end
