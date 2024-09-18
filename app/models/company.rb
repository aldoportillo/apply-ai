class Company < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :jobs, dependent: :destroy

  validates :name, :address, :website, presence: true
end
