class ShoppingListController < ApplicationController
  def index
    @food = current_user.food.includes(:recipe_foods)
  end
end
