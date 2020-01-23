class ChangeCardnumberColumnFromIntegerToBigint < ActiveRecord::Migration[5.2]
  def change
    change_column :card_infos, :card_number, :bigint, null: false
  end
end
