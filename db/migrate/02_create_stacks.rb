class CreateStacks < ActiveRecord::Migration[4.2]
	def change
		create_table :stacks do |t|
			t.string :title
			t.integer :user_id
		end 
	end 
end