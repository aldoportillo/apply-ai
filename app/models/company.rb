class Company < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :job_postings, dependent: :destroy

  validates :name, :address, :website, presence: true
end
