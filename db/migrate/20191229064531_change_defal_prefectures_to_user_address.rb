class ChangeDefalPrefecturesToUserAddress < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_addresses, :prefectures, nil
  end
end
