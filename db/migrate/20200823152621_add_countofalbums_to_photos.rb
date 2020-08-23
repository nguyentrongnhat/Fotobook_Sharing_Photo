class AddCountofalbumsToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :count_of_albums, :int, :default => 0
  end
end
