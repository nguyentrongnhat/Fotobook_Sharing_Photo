class CreateFollows < ActiveRecord::Migration[6.0]
	def change
		create_table :follows do |t|
			t.belongs_to :user
			t.integer :id_following
			t.timestamps
		end
	end
end
