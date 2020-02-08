class AddColumnBuyerToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :status, :integer, null: true
    add_column :products, :buyer_id, :integer, null: true
  end
end
