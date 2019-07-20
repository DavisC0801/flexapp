class MealSearchesController < ApplicationController
  def create
    search_terms = {meal_name: params[:meal_input], size: params[:commit]}
    search = FoodSearchService.new(search_terms)
    redirect_to new_meal_logs_path(search.food_lookup)
  end
end
