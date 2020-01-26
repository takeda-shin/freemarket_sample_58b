class ChangeBirthdayColumnToDate < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :user, :birthday, :date, null: false
    end
  
    # 変更前の状態
    def down
      change_column :user, :birthday, :integer, null: false
    end
  end
end
