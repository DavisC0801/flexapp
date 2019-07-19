class MealLogsController < ApplicationController
  def new
    render locals:{
      facade: MealLogNewFacade.new(meal_log_params)
    }
  end

  def create
    #todo - Update to scope to current_user
    meal = MealLog.new(meal_log_params)
    if meal.save
      redirect_to dashboard_path
    else
      flash.now[:danger] = meal.errors.full_messages
      render :new
    end
  end

  private

  def meal_log_params
    params.permit(:calories, :fats, :protein, :carbs, :sugars, :sodium, :meal)
  end
end
