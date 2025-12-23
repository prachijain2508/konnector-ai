class Batch < ApplicationRecord
  belongs_to :course
  has_many :enrollment_requests
  has_many :students, through: :enrollment_requests, source: :student

  validates :name, presence: true
end