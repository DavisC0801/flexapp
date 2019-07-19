class MealLogsController < ApplicationController
  def new
    render locals:{
      facade: MealLogNewFacade.new(meal_log_params)
    }
  end

  private

  def meal_log_params
    params.permit(:calories, :fats, :protein, :carbs, :sugars, :sodium, :meal)
  end
end
