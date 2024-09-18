class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :resumes, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :bookmarked_jobs, dependent: :destroy
  has_many :watchings, dependent: :destroy
  has_many :roles, dependent: :destroy

  validates :name, :address, :phone_number, :dob, presence: true

  before_save :normalize_name

  private

  def normalize_name
    self.name = name.titleize
  end
end
