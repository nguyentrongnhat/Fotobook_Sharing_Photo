class CreateAps < ActiveRecord::Migration[6.0]
	def change
		create_table :aps do |t|
			t.belongs_to :album
			t.belongs_to :photo
			t.timestamps
		end
	end
end
