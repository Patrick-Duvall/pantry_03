require "./test/test_helper.rb"

class RecipeTest < Minitest::Test

  def setup
    @flour = Ingredient.new('flour', 'cup', 45)
    @milk = Ingredient.new('milk', 'cup', 60)
    @recipe = Recipe.new('milky flour')
  end

  def test_has_name
    assert_equal 'milky flour', @recipe.name
  end

  def test_ingredients_start_empty_can_add
    assert_equal ({}), @recipe.ingredients
    @recipe.add_ingredient(@milk, 2)
    assert_equal ({ @milk => 2}), @recipe.ingredients
    @recipe.add_ingredient(@flour, 1)
    assert_equal ({@milk => 2, @flour => 1}) , @recipe.ingredients
  end

  def test_lists_ingredients
    @recipe.add_ingredient(@milk,1)
    @recipe.add_ingredient(@flour,3)
    assert_equal ['milk','flour'], @recipe.ingredients_list
  end

  def test_can_check_ingredient_quantity
    @recipe.add_ingredient(@flour,3)
    assert_equal 3, @recipe.check_quantity(@flour)
  end

  def test_recipe_knows_total_calories
    @recipe.add_ingredient(@flour,2)
    @recipe.add_ingredient(@milk,1)
    assert_equal 150, @recipe.total_calories
  end

end
