class Clients::RecipesController < Clients::BaseController
  def index
    render locals: {
      facade: ClientRecipesFacade.new(current_client.meal_plan)
    }
  end
end
