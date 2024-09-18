class Education < ApplicationRecord
  belongs_to :user
  has_many :resume_educations, dependent: :destroy
  has_many :resumes, through: :resume_educations

  validates :school, :discipline, presence: true
end
