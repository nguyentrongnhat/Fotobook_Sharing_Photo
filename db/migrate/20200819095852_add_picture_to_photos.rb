class AddPictureToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :picture, :string
  end
end
