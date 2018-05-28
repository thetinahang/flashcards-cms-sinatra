class FlashcardsController < ApplicationController
	
	get "/flashcards" do 
		redirect_if_not_logged_in
		erb :'/stacks'
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

	patch "/flashcards/:id" do 
		@flashcard = Flashcard.find_by_id(params[:id])
		if params[:question] == "" || params[:answer] == "" 
			redirect to "/flashcards/#{params[:id]}/edit"
		else
			@flashcard.question = params[:question]
			@flashcard.answer = params[:answer]
			@flashcard.stack_id = params[:stack_id]
			@flashcard.save
			redirect to "/flashcards/#{params[:id]}"
		end
	end 

	get "/flashcards/:id" do 
		redirect_if_not_logged_in
		@flashcard = Flashcard.find(params[:id])
		erb :'flashcards/show'
	end 

	post "/flashcards" do 
		if params[:question] == "" || params[:answer] == "" 
			redirect "/flashcards/new"
		else 
			@flashcard = Flashcard.create(params)
			redirect "/flashcards/#{@flashcard.id}"
		end 
	end 

	post '/flashcards/:id/delete' do
		flashcard = Flashcard.find(params[:id])
		flashcard.delete
		redirect '/stacks'
	end
end