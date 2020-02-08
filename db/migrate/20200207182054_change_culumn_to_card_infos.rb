class ChangeCulumnToCardInfos < ActiveRecord::Migration[5.2]
  def change
    change_column :card_infos, :card_number, :bigint, null: true
    change_column :card_infos, :security_code, :integer, null: true
    change_column :card_infos, :use_limit_month, :integer, null: true
    change_column :card_infos, :use_limit_year, :integer, null: true
  end
end
