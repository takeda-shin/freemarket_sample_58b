class AddEstimatedDeliveryToproducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :estimated_delivery, :string
  end
end
