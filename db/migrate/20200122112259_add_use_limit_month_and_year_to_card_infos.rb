class AddUseLimitMonthAndYearToCardInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :card_infos, :use_limit_month, :integer, null: false
    add_column :card_infos, :use_limit_year, :integer, null: false
  end
end
