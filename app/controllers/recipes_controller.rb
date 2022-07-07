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

  def destroy; end

  def recipe_params; end
end
