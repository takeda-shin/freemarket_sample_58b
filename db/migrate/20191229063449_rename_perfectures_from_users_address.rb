class RenamePerfecturesFromUsersAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_addresses, :perfectures, :prefectures
  end
end
