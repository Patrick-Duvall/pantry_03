class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def recipe_summary(recipe)
    require "pry"; binding.pry
    x = recipe.ingredients.sort_by{|k,v| k.calories_per_unit * v}.reverse.map{|ing| {ingredient: ing[0].name, amount: ing[1].to_s + ' ' + ing[0].unit.to_s}}
    # require "pry"; binding.pry
    {
      name: recipe.name,
      :details => {
        ingredients:
        x,
        total_calories: recipe.total_calories
      }

      }
  end

  def summary
    sorted = @recipes.sort_by(&:total_calories)
    sorted.map{|recipe| recipe_summary(recipe)}
  end


end
