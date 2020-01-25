class AddbirthdayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday_year, :integer, null: false
    add_column :users, :birthday_month, :integer, null: false
    add_column :users, :birthday_date, :integer, null: false
  end
end
