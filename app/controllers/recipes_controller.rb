class RecipesController < ApplicationController

  before_action: require_user, expect: [:show, :index]

  before_action: require_same_user, only: [:edit,:update]

	  def index

		@recipe = Recipe.all
    end


    def show

        @recipe = Recipe.find(params[:id])

    end


    def new
         
         @recipe = Recipe.new

    end

   def create

   	@recipe = Recipe.new(recipe_params)

   	@recipe.chef = current_user

   	if @recipe.save

   		flash[:success] = "your recipe was created"
   		redirect_to recipes_path

   	else

        render :new

   	end

   end



   def edit

   	@recipe = Recipe.find(params[:id])

   end

   def update
   	@recipe = Recipe.find(params[:id])
   	if @recipe.update(recipe_params)
    flash[:success] = "your recipe is successfully updates"
    redirect_to recipe_path(@recipe)
    else 
    render edit
    end
  end


  def like

    @recipe = Recipe.find(params[:id])
    like = like.create(like: params[:like],chef: current_user,recipe: @recipe)
    if like.valid?
    flash[:success] = "your section is successfully"
    redirect_to :back
    else
    flash[:danger] = " you can like and dislike a recipe once"
    redirect_to :back

   end
    

  end


   private

   def recipe_params
    
    params.require(:recipe).permit(:name,:summary,:description,:picture)

   end

    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "you can edit your recipe only"
        redirect_to recipes_path
      end
    end


end
