require "./test/test_helper.rb"

class IngredientTest < Minitest::Test

  def test_has_attributes
    flour = Ingredient.new('flour', 'cup', 45)
    assert_equal 'flour', flour.name
    assert_equal 'cup', flour.unit
    assert_equal 45, flour.calories_per_unit
  end

end
