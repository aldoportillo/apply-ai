class CreateCoverLetters < ActiveRecord::Migration[7.2]
  def change
    create_table :cover_letters do |t|
      t.text :content
      t.references :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
