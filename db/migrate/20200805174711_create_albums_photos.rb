class CreateAlbumsPhotos < ActiveRecord::Migration[6.0]
	def change
		create_table :albums_photos, id: false do |t|
			t.belongs_to :album
			t.belongs_to :photo
		end
	end
end
