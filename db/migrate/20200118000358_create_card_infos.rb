class CreateCardInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :card_infos do |t|
      t.integer :user_id, null: false
      t.integer :card_number, null: false
      t.integer :use_limit, null: false
      t.integer :security_code, null: false
      t.timestamps
    end
  end
end
