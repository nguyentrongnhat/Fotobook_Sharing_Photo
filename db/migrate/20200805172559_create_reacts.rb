class CreateReacts < ActiveRecord::Migration[6.0]
	def change
		create_table :reacts do |t|
			t.integer  :user_react
			t.bigint  :reactable_id
			t.string  :reactable_type
			t.timestamps
		end

		add_index :reacts, [:reactable_type, :reactable_id]
	end
end
