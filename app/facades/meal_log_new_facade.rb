class MealLogNewFacade
  def initialize(params)
    @meal_log_params = Hash.new(0)
    @meal_log_params[:name] = params[:meal]
    @meal_log_params[:meal_calories] = params[:calories]
    @meal_log_params[:meal_fats] = params[:fats]
    @meal_log_params[:meal_carbs] = params[:carbs]
    @meal_log_params[:meal_protein] = params[:protein]
    @meal_log_params[:meal_sugars] = params[:sugars]
    @meal_log_params[:meal_sodium] = params[:sodium]
    @meal_log_params[:meal_time] = Time.now.change(sec: 0) - 7.hour
    @meal_log_params[:meal_date] = Date.today
  end

  def meal_log
    MealLog.new(@meal_log_params)
  end
end
