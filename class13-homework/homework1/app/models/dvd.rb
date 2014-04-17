class Dvd < ActiveRecord::Base
  validates :name, presence: true
  validates :director, presence: true
  validates :length, presence: true
end
