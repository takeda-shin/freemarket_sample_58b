class RemoveBirthdayMonthDateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birthday_month, :integer
    remove_column :users, :birthday_date, :integer
  end
end
