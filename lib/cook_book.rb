class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def recipe_summary(recipe)
    sorted = recipe.ingredients.sort_by{|k,v| k.calories_per_unit * v}.reverse
    ingredient_details = sorted.map do|ing|
       {
         ingredient: ing[0].name,
         amount: ing[1].to_s + ' ' + ing[0].unit.to_s
       }
     end
     return {
      name: recipe.name,
      :details => {
        ingredients:
        ingredient_details,
        total_calories: recipe.total_calories
      }
    }
  end

  def summary
    sorted = @recipes.sort_by(&:total_calories)
    sorted.map{|recipe| recipe_summary(recipe)}
  end


end
