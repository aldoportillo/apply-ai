class CreateResumeEducations < ActiveRecord::Migration[7.2]
  def change
    create_table :resume_educations do |t|
      t.references :resume, null: false, foreign_key: true
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
