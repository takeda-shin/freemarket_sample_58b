class AddColumnImageToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image, :string, :default => "hoge.png"
  end
end
