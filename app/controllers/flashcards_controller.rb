class FlashcardsController < ApplicationController
	
	get "/flashcards" do 
		redirect_if_not_logged_in
		@flashcards = Flashcard.all
		erb :'flashcards/index'
	end 

	get "/flashcards/new" do 
		redirect_if_not_logged_in
		@error_message = params[:error]
		erb :'flashcards/new'
	end 

	get "/flashcards/:id/edit" do 
		redirect_if_not_logged_in
		@error_message = params[:error]
		@flashcard = Flashcard.find(params[:id])
		erb :'flashcards/edit'
	end

	post "/flashcards/:id" do 
		redirect_if_not_logged_in
		@flashcard = Flashcard.find(params[:id])
		unless Flashcard.valid_params?(params)
			redirect "/flashcards/#{@flashcard.id}/edit?error=invalid flashcard"
		end 
		@flashcard.update(params.select{|k|k == "question" || k == "answer" || k == "stack_id"})
		redirect "/flashcards/#{@flashcard.id}"
	end 

	get "/flashcards/:id" do 
		redirect_if_not_logged_in
		@flashcard = Flashcard.find(params[:id])
		erb :'flashcards/show'
	end 

	post "/flashcards" do 
		redirect_if_not_logged_in
		unless Flashcard.valid_params?(params)
			redirect "/flashcards/new?error=invalid flashcard"
		end 
		Flashcard.create(params)
		redirect "/flashcards"
	end 
end