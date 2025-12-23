class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  belongs_to :school, optional: true
  has_many :enrollment_requests, foreign_key: :student_id
  has_many :batches, through: :enrollment_requests

  enum role: { student: 0, school_admin: 1, admin: 2 }

  validates :name, presence: true
end