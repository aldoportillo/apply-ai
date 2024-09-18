class Skill < ApplicationRecord
  belongs_to :user
  has_many :resume_skills, dependent: :destroy
  has_many :resumes, through: :resume_skills

  validates :name, presence: true
end
