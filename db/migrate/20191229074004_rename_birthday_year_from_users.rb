class RenameBirthdayYearFromUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :birthday_year, :birthday
  end
end
