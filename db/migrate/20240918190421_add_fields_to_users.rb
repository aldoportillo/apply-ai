class AddFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :dob, :date
  end
end
