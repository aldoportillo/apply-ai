class Job < ApplicationRecord
  belongs_to :role
  belongs_to :company
  has_many :applications, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :watchings, dependent: :destroy

  validates :title, :description, :company_id, :posted_date, presence: true

  scope :recent, -> { where("posted_date >= ?", 30.days.ago) }
  scope :by_company, ->(company_id) { where(company_id: company_id) }
end
