class MealSearchesController < ApplicationController
  def create
    search_terms = {meal_name: params[:meal_input], size: params[:commit]}
    search = FoodSearchService.new
    if search_terms[:meal_name].empty? || search_terms[:meal_name].nil?
      flash[:error] = "Invalid Meal Name, Please Try Again."
      redirect_to new_meal_logs_path
    else
      redirect_to new_meal_logs_path(search.food_lookup(search_terms))
    end
  end
end
