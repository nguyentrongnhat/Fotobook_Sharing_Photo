class AddCountreactToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :count_of_reacts, :int, :default => 0
  end
end
