class ShoppingListController < ApplicationController
  def index
    @food = current_user.foods.includes(:recipe_foods)
  end
end
