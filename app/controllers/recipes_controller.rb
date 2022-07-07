class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user).all.where(publik: true).order(created_at: :desc)
    render :public_recipes
  end

  def new; end

  def create; end

  def show; end

  def delete
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe deleted Successfully'
    else
      redirect_to root, alert: 'Could not delete recipe'
    end
  end

  def recipe_params; end
end
