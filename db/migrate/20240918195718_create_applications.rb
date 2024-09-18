class CreateApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.references :resume, null: false, foreign_key: true
      t.references :cover_letter, null: false, foreign_key: true
      t.string :status
      t.date :applied_date

      t.timestamps
    end
  end
end
