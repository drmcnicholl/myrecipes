class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end
  
  def show
     @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)
    
    if @recipe.save
      #show a message in green background
      flash[:success] = "Your recipe was created successfully!"
      #then redirect to recipes
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
      flash[:success] = "Recipe updated successfully!"
      
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  private
  
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description)
    end
  
end