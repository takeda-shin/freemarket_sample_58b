class AddDefaultToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :name, "abe"
    change_column_default :products, :image, "hoge.png"
  end
end
