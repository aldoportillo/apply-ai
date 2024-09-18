class Experience < ApplicationRecord
  belongs_to :user
  has_many :resume_experiences, dependent: :destroy
  has_many :resumes, through: :resume_experiences

  validates :company, :role, :start_date, :end_date, presence: true
end
