class CreateDeliveryAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_areas do |t|
      t.string "delivery_method"
      t.timestamps
    end
  end
end
