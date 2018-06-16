class FlashcardsController < ApplicationController
	
	get "/flashcards" do 
		redirect_if_not_logged_in
		erb :'/stacks'
	end 

	get "/flashcards/new" do 
		redirect_if_not_logged_in
		erb :'flashcards/new'
	end 

	get "/flashcards/:id/edit" do #user needs to be verified
		@flashcard = Flashcard.find(params[:id])
		if @flashcard.user_id == current_user.id
			erb :'flashcards/edit'
		else 
			redirect '/stacks'
		end
	end

	patch "/flashcards/:id" do #user needs to be verified
		if logged_in?
			#@user=User.find_by_id(params[:id]) #needs to be connected to the stacks table?
			@flashcard = Flashcard.find_by_id(params[:id])
			if @flashcard.user_id == current_user.id
				if params[:question] == "" || params[:answer] == "" 
					redirect to "/flashcards/#{params[:id]}/edit"
				else
					@flashcard.question = params[:question]
					@flashcard.answer = params[:answer]
					@flashcard.stack_id = params[:stack_id]
					@flashcard.save
					redirect to "/flashcards/#{params[:id]}"
				end
			else 
				redirect to "/flashcards/#{params[:id]}"
			end
		else
			erb :'/flashcards'
		end
	end 

	get "/flashcards/:id" do #user needs to be verified
		@flashcard = Flashcard.find(params[:id])
		if @flashcard.user_id == current_user.id 
			erb :'flashcards/show'
		else 
			redirect '/stacks'
		end
	end 

	post "/flashcards" do 
		if params[:question] == "" || params[:answer] == "" 
			redirect '/flashcards/new'
		else 
			@user = User.find(current_user.id)
			@flashcard = Flashcard.new
			@flashcard.question = params[:question]
			@flashcard.answer = params[:answer]
			@flashcard.stack_id = params[:stack_id]
			@flashcard.user_id = @user.id
			@flashcard.save
			redirect "/flashcards/#{@flashcard.id}"
		end 
	end 

	post "/flashcards/:id/delete" do
		flashcard = Flashcard.find(params[:id])
		if @gflashcard/user_id == current_user.id 
			flashcard.delete
			redirect '/stacks'
		else 
			redirect '/stacks'
		end
	end
end