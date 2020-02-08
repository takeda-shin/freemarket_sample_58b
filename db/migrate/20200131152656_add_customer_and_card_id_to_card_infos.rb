class AddCustomerAndCardIdToCardInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :card_infos, :customer_id, :string, null: false
    add_column :card_infos, :card_id, :string, null: false
  end
end
