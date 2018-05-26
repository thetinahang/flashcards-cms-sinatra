class UsersController < ApplicationController 

	get '/signup' do 
		erb :'users/new'
	end

	post '/signup' do 
	end 

	get '/login' do 
		erb :'users/login'
	end 

	post '/login' do 
	end 

end