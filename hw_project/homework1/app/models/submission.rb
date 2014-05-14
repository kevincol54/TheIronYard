class Submission < ActiveRecord::Base
  belongs_to :user
  # belongs_to :assignment
  has_many :comments, as: :commentable
  has_many :links
  accepts_nested_attributes_for :links, allow_destroy: true
  validate :custom_submission_validation

  include Workflow
  workflow do 
    state :new do
      event :reviewing, transitions_to: :reviewing
    end

    state :reviewing do
      event :complete, transitions_to: :complete
      event :incomplete, transitions_to: :incomplete
    end

    state :incomplete do
      event :reviewing, transitions_to: :reviewing
    end

    state :complete
  end

  def custom_submission_validation
    if Submission.where(user_id:self.user_id, assignment_id:self.assignment_id).length >= 1
      errors.add(:msg, "You Have Already Submitted For This Assignment")
    end   
  end
end