class Watching < ApplicationRecord
  belongs_to :user
  belongs_to :job

  validates :user_id, uniqueness: { scope: :job_id, message: "is already watching this job" }
end
