class UsersController < ApplicationController 

	get '/signup' do 
		if !logged_in?
			erb :'users/new'
		else 
			redirect '/stacks'
		end
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
		@error_message = params[:error]
		if !session[:user_id]
			erb :'users/login'
		else 
			redirect '/stacks'
		end
	end 

	post '/login' do 
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect '/stacks'
		else 
			redirect '/signup'
		end
	end

	get '/logout' do 
		if session[:user_id] != nil 
			session.destroy
			redirect '/login'
		else 
			redirect '/'
		end
	end 

	get '/users/:id' do 
		if !logged_in? 
			redirect '/'
		end 

		@user = User.find(params[:id])
		if !@user.nil? && @user == current_user 
			erb :'users/show'
		else 
			redirect '/stacks'
		end  
	end 

end