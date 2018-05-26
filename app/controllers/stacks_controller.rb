class StacksController < ApplicationController

	get "/stacks" do 
		redirect_if_not_logged_in
		erb :'stacks/index'
	end 

	get "/stacks/new" do 
		redirect_if_not_logged_in
		erb :'stacks/new'
	end 

	get "/stacks/:id/edit" do 
		redirect_if_not_logged_in
		erb :'stacks/edit'
	end

	post "/stacks/:id" do 
		redirect_if_not_logged_in
	end 

	get "/stacks/:id" do 
		redirect_if_not_logged_in
		erb :'stacks/show'
	end 

	post "/stacks" do 
		redirect_if_not_logged_in
	end 

end