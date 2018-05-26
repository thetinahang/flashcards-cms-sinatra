class FlashcardsController < ApplicationController
	
	get "/flashcards" do 
		redirect_if_not_logged_in
		erb :'flashcards/index'
	end 

	get "/flashcards/new" do 
		redirect_if_not_logged_in
		erb :'flashcards/new'
	end 

	get "/flashcards/:id/edit" do 
		redirect_if_not_logged_in
		erb :'flashcards/edit'
	end

	post "/flashcards/:id" do 
		redirect_if_not_logged_in
	end 

	get "/flashcards/:id" do 
		redirect_if_not_logged_in
		erb :'flashcards/show'
	end 

	post "/flashcards" do 
		redirect_if_not_logged_in
	end 
end