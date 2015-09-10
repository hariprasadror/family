class ChefsController < ApplicationController

    before_action :require_same_user, only: [:edit,:update]

	def index
     
     @chef = Chef.all

	end

	def new

		@chef = Chef.new

	end

	def create

		@chef = Chef.new(chef_params)

		if @chef.save
			flash[:success] = "register the email success "
            session[:chef_id] = @chef.id
			redirect_to recipes_path

		else
        render 'new'
	    end

	end



	def edit

		@chef = Chef.find(params[:id])

    end
   

    def upadate

    	@chef = Chef.find(paras[:id])
    	if @chef.update(chef_params)
    		flash[:success] = "update success"
    		redirect_to chef_path(@chefs)  #to do change the chef
    	else
    	render 'edit'
        end

    end


    def show

    	@chef = Chef.find(params[:id])
    	@recipe = @chef.recipes

    end


    private

    def chef_params

    	params.require(:chef).permit(:chefname,:email,:password)

    end

    def require_same_user
        if current_user != @chef
            flash[:danger] = "you can only edit your profile"
        redirect_to root_path
         end
    end


end