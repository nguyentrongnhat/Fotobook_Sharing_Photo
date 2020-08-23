class AddCountreactToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :count_of_reacts, :int, :default => 0
  end
end
