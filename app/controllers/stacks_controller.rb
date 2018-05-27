class StacksController < ApplicationController

	get "/stacks" do 
		redirect_if_not_logged_in
		@stacks = Stack.all
		erb :'stacks/index'
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

	post "/stacks/:id" do 
		redirect_if_not_logged_in
		@stack = Stack.find(params[:id])
		unless Stack.valid_params?(params)
			redirect "/stacks/#{@stack.id}/edit?error=invalid stack"
		end 
		@stack.update(params.select{|k|k == "title" || k == "user_id"})
		redirect "/stacks/#{@stack.id}"
	end 

	get "/stacks/:id" do 
		redirect_if_not_logged_in
		@stacl = Stack.find(params[:id])
		erb :'stacks/show'
	end 

	post "/stacks" do 
		redirect_if_not_logged_in
		unless Stack.valid_params?(params)
			redirect "/stacks/new?error=invalid stack"
		end 
		Stack.create(params)
		redirect "/stacks"
	end 

end