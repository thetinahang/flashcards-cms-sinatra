class UsersController < ApplicationController 

	get '/signup' do 
		if !session[:user_id]
			erb :'users/new'
		else 
			redirect '/stacks'
	end

	post '/signup' do 
		if params[:username] == "" || params[:password] == ""
			redirect '/signup'
		else 
			@user = User.create(:username => params[:username], :password => params[:password])
			session[:user_id] = @user.id 
			redirect '/stacks'
		end 
	end 

	get '/login' do 
		erb :'users/login'
	end 

	post '/login' do 
	end 

end