class RemoveUseLimitFromCardInfos < ActiveRecord::Migration[5.2]
  def change
    remove_column :card_infos, :use_limit, :integer
  end
end
