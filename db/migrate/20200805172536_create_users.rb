class CreateUsers < ActiveRecord::Migration[6.0]
	def change
		create_table :users do |t|

			t.string :pass
			t.string :pass_confirmation
			t.string :lastname
			t.string :firstname
			t.timestamps
		end
	end
end
