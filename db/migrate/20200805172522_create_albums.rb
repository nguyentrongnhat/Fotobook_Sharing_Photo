class CreateAlbums < ActiveRecord::Migration[6.0]
	def change
		create_table :albums do |t|
			t.belongs_to :user
			t.string :title
			t.string :decription
			t.string :source
			t.boolean :status, :default => true
			t.timestamps
		end
	end
end
