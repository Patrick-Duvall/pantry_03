class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def restock(ingredient, num)
    if @stock[ingredient]
      @stock[ingredient] += num
    else
      @stock[ingredient] = num
    end
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients.all? do |ingredient|
      @stock[ingredient[0]] >= ingredient[1]
    end
  end


end
