class CreateJobPostings < ActiveRecord::Migration[7.2]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.references :role, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :salary
      t.string :wage
      t.date :posted_date
      t.text :requirements

      t.timestamps
    end
  end
end
