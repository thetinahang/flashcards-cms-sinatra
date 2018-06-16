class AddUserIdToFlashcards < ActiveRecord::Migration[5.1]
	def change
		add_column :flashcards, :user_id, :integer
	end
end