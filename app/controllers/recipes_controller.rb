class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
      @recipes = Recipe.where(user_id: current_user).order("created_at DESC")  #this will list the most recently created recipes first
  end

  def show
      @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.build
  end

  def edit
    @recipe = Recipe.find(params[:id])  #this brings up the form with everything filled in from database
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)

    redirect_to @recipe  #the redirect_to is what added the article id to the url after creation to show created article

  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)  #update a record that already exists
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user_id    #needed since we need the user_id but it is not in the url once you 'show' recipe
    @recipe.destroy

    redirect_to user_recipes_path(@user)   #redirect to the list of all users page
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :calories, :servingSize, :timeCook, :timePrep, :picture, :description, :directions, :ingredients)
    end
end
