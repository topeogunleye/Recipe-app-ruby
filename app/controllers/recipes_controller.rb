class RecipesController < ApplicationController
  def index
    @user = current_user
    @recipes = @user&.recipe
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user).all.where(publik: true).order(created_at: :desc)
    render :public_recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render new, status: :unprocessable_entity, alert: 'An error has occurred while creating the new recipe'
    end
  end

  def show
  end

  def delete
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted Successfully'
    else
      redirect_to root, alert: 'Could not delete recipe'
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :prepration_time, :cooking_time, :description, :publik)
  end
end
