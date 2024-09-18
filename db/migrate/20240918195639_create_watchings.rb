class CreateWatchings < ActiveRecord::Migration[7.2]
  def change
    create_table :watchings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
