class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
