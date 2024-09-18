class CreateEducations < ActiveRecord::Migration[7.2]
  def change
    create_table :educations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :school
      t.string :discipline
      t.text :description

      t.timestamps
    end
  end
end
