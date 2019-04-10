class Recipe
  attr_reader :name, :ingredients
  def initialize(name)
    @name = name
    @ingredients = Hash.new(0)
  end
  #can overwrite ingredients, but recipes can change
  def add_ingredient(ingredient, num)
    @ingredients[ingredient] = num
  end

  def ingredients_list
    @ingredients.keys.map(&:name)
  end

  def check_quantity(ingredient)
    @ingredients[ingredient]
  end

  def total_calories
    arrray = @ingredients.to_a
    arrray.map{|ingredient| ingredient[0].calories_per_unit * ingredient[1]}.reduce(&:+)
  end



end
