class MealLogsController < ApplicationController
  def new
    @meal_log = MealLog.new
  end
end
