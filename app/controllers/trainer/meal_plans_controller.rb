class Trainer::MealPlansController < ApplicationController
  def new
    @client = Client.find(params[:id])
    @meal_plan = @client.build_meal_plan
  end

  def create
    @client = Client.find(params[:format])
    @meal_plan = @client.build_meal_plan(meal_plan_params)
    @meal_plan.vegetarian = false if @meal_plan.vegetarian && @meal_plan.vegan
    if @meal_plan.save
      flash.notice = "Successfully created meal plan for #{@client.first_name} #{@client.last_name}"
      redirect_to trainer_client_path(@client)
    else
      render :new
    end
  end

  private

  def meal_plan_params
    params.require(:meal_plan).permit(:calories,
                                      :excluded,
                                      :vegan,
                                      :vegetarian,
                                      :diet_type)
  end
end
