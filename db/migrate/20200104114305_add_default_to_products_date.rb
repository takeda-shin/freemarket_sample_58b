class AddDefaultToProductsDate < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :created_at, "2020-01-01 23:59:59"
    change_column_default :products, :updated_at, "2020-01-01 23:59:59"
  end
end
