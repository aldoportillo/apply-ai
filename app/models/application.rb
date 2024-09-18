class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :resume
  belongs_to :cover_letter

  validates :status, presence: true
  validates :user_id, uniqueness: { scope: :job_id, message: "has already applied for this job" }

  before_create :set_applied_date
  after_create :notify_employer

  private

  def set_applied_date
    self.applied_date ||= Date.today
  end
end
