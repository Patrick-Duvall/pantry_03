require "./test/test_helper"

class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@mac, 8)
    @mac_and_cheese.add_ingredient(@cheese, 2)
  end

  def test_stock_starts_empty_can_restock
    assert_equal ({}), @pantry.stock
    @pantry.restock(@cheese, 5)
    assert_equal ({@cheese =>5}), @pantry.stock
    @pantry.restock(@cheese, 10)
    assert_equal ({@cheese =>15}), @pantry.stock
    @pantry.restock(@mac, 5)
    assert_equal ({@cheese =>15, @mac => 5}), @pantry.stock
  end

  def test_can_check_stock
    @pantry.restock(@cheese, 5)
    assert_equal 5, @pantry.stock_check(@cheese)
  end

  def test_checks_if_recipe_is_makeable
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@cheese, 10)
    refute @pantry.enough_ingredients_for?(@mac_and_cheese)
    @pantry.restock(@mac, 10)
    assert @pantry.enough_ingredients_for?(@mac_and_cheese)
  end


end
