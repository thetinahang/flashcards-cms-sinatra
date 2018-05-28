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
		redirect_if_not_logged_in
		@error_message = params[:error]
		erb :'stacks/new'
	end 

	get "/stacks/:id/edit" do 
		redirect_if_not_logged_in
		@error_message = params[:error]
		@stack = Stack.find(params[:id])
		erb :'stacks/edit'
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

	get "/stacks/:id" do 
		redirect_if_not_logged_in
		@stack = Stack.find(params[:id])
		erb :'stacks/show'
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

	post '/stacks/:id/delete' do
		stack = Stack.find(params[:id])
		if stack.user_id == current_user.id
			stack.delete
			stack.save
			redirect to "/stacks"
		else
			redirect to "/stacks"
		end
	end

end