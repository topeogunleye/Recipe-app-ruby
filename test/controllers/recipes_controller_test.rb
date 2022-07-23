require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:one)
  end

  test 'should get index' do
    get recipes_url
    assert_response :success
  end

  test 'should get new' do
    get new_recipe_url
    assert_response :success
  end

  test 'should create recipe' do
    assert_difference('Recipe.count') do
      post recipes_url, params: { recipe: { name: @recipe.name } }
    end

    assert_redirected_to recipe_url(Recipe.last)
  end

  test 'should show recipe' do
    get recipe_url(@recipe)
    assert_response :success
  end
end
