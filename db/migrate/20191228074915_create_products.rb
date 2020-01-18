class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string          :name,  null: false
      t.text	          :text,    null: false
      t.string          :category_id,  null: false, foreign_key: true
      t.integer         :brand_id,	foreign_key: true
      t.integer         :price,	null: false
      t.string          :product_size	
      t.string          :condition,	null: false
      t.string          :shipping_charge
      t.string          :shipping_method
      t.string          :delivery_area,	null: false
      t.integer         :user_id,	null: false, foreign_key: true
      t.timestamps
    end
  end
end
