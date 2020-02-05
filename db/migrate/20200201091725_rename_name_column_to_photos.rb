class RenameNameColumnToPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :name, :image_url
  end
end
