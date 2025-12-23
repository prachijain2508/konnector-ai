class School < ApplicationRecord
  has_many :users
  has_many :courses, dependent: :destroy
  has_many :batches, through: :courses
  
  validates :name, presence: true, uniqueness: true
end