class LoginsController < ApplicationController


	def new

	end


	def create


		chef = Chef.find_by(email: params[:email])
		if chef && chef.authenticate(params[:password])

			session[:chef_id] = chef.id
			flash.now[:success] = "your login in"
		    redirect_to recipes_path

		else
        
        flash.now[:danger] = "your email and password doesnt match"
        render 'new'

                    
		end

	end

	def destroy

		session[:chef_id] = nil
		flash.now[:success] = "your login in"
		redirect_to root_path


	end


end