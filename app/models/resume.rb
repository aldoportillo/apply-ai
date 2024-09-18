class Resume < ApplicationRecord
  belongs_to :user
  has_many :resume_experiences, dependent: :destroy
  has_many :experiences, through: :resume_experiences
  has_many :resume_skills, dependent: :destroy
  has_many :skills, through: :resume_skills
  has_many :resume_educations, dependent: :destroy
  has_many :educations, through: :resume_educations
  has_one :cover_letter, dependent: :destroy

  after_create :create_default_cover_letter

  private

  def create_default_cover_letter
    create_cover_letter(content: "Your default cover letter content here.")
  end
end
