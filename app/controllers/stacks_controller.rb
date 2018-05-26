class StacksController < ApplicationController

	get "/stacks" do 
		erb :'stacks/index'
	end 

	get "/stacks/new" do 
		erb :'stacks/new'
	end 

	get "/stacks/:id/edit" do 
		erb :'stacks/edit'
	end

	post "/stacks/:id" do 
	end 

	get "/stacks/:id" do 
		erb :'stacks/show'
	end 

	post "/stacks" do 
	end 

end