class ChangeBirthdayColumnFromIntegerToDate < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :users, :birthday, :date, null: false
    end
  
    # 変更前の状態
    def down
      change_column :users, :birthday, :integer, null: false
    end
  end
end
