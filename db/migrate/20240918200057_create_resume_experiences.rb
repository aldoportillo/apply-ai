class CreateResumeExperiences < ActiveRecord::Migration[7.2]
  def change
    create_table :resume_experiences do |t|
      t.references :resume, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
