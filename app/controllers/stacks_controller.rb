class StacksController < ApplicationController

	get "/stacks" do 
		if logged_in?
			@user = User.find(current_user.id)
			@stacks = Stack.all
			erb :'stacks/index'
		else
			redirect_if_not_logged_in
		end
	end 

	get "/stacks/new" do 
		if logged_in? 
			@user = User.find(current_user.id)
			erb :'stacks/new'
		else 
			redirect_if_not_logged_in
		end 
	end 

	post "/stacks" do 
		if params[:title] == ""
			redirect "/stacks/new"
		else 
			@user = User.find(current_user.id)
			@stack = Stack.create(:title => params[:title])
			@user.stacks << @stack 
			redirect "/stacks/#{@stack.id}"
		end 
	end 

	get "/stacks/:id" do 
		if logged_in?
			@user = User.find(current_user.id)
			@stack = Stack.find(params[:id])
			if @stack.user_id == current_user.id 
				erb :'stacks/show'
			else 
				redirect '/stacks'
			end
		else 
			redirect_if_not_logged_in
		end 
	end 

	get "/stacks/:id/edit" do 
		if logged_in?
			@user = User.find(current_user.id)
			@stack = Stack.find(params[:id])
			if @stack.user_id == current_user.id 
				erb :'stacks/edit'
			else 
				redirect '/stacks'
			end 
		else 
			redirect_if_not_logged_in
		end 
	end

	patch "/stacks/:id" do 
		@stack = Stack.find_by_id(params[:id])
		if params[:title] == ""
			redirect to "/stacks/#{params[:id]}/edit"
		else
			@stack.title = params[:title]
			@stack.save
			redirect to "/stacks/#{params[:id]}"
		end
	end 
 
	post "/stacks/:id/delete" do
		stack = Stack.find(params[:id])
		if stack.user_id == current_user.id
			stack.delete
			stack.save
			redirect to '/stacks'
		else
			redirect to '/stacks'
		end
	end

end