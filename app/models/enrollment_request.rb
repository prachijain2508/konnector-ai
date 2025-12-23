class EnrollmentRequest < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :batch

  enum status: { pending: 0, approved: 1, rejected: 2 }
  
  validates :student_id, uniqueness: { scope: :batch_id, message: "already requested for this batch" }
end