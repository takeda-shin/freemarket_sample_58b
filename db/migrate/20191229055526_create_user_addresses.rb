class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id, null: false
      t.integer :postal_code, null: false
      t.string :perfectures, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.timestamps
    end
  end
end
