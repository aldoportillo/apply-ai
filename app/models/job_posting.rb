class JobPosting < ApplicationRecord
  belongs_to :role
  belongs_to :company
end
