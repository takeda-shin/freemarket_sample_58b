class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birthday, :integer, null: false
  end
end
