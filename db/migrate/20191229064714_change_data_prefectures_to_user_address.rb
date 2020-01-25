class ChangeDataPrefecturesToUserAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :user_addresses, :prefectures, :integer
  end
end
