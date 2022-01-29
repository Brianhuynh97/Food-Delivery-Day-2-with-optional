require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(repository)
    @meals_view = MealsView.new
    @meal_repository = repository
  end

  def add
    name = @meals_view.ask_for('name of this meal')
    price = @meals_view.ask_for_number('price of this meal')
    @meal_repository.create(Meal.new(name: name, price: price))
  end

  def remove
    list
    index = @meals_view.ask_for_index
    @meal_repository.destroy(index)
  end

  def list
    @meals_view.display(@meal_repository.all)
  end
end
