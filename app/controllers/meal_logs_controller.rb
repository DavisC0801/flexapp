class MealLogsController < ApplicationController
  def new
    render locals:{
      facade: MealLogNewFacade.new(meal_base_params)
    }
  end

  def create
    #todo - Update to scope to current_user
    meal = MealLog.new(meal_log_params)
    if meal.save
      redirect_to dashboard_path
    else
      redirect_to new_meal_logs_path
    end
  end

  private

  def meal_base_params
    params.permit(:calories, :fats, :protein, :carbs, :sugars, :sodium, :meal)
  end

  def meal_log_params
    params.require(:meal_log).permit(:name, :meal_time, :meal_date, :meal_calories, :meal_fats, :meal_protein, :meal_carbs, :meal_sugars, :meal_sodium)
  end
end
