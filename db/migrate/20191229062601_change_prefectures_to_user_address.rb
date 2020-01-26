class ChangePrefecturesToUserAddress < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :user_address, :prefectures, :integer, null: false
    end
  
    # 変更前の状態
    def down
      change_column :user_address, :perfectures, :string, null: false
    end
  end
end
