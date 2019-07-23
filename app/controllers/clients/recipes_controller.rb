class Clients::RecipesController < Clients::BaseController
  def index
    render locals: {
      facade: ClientRecipesFacade.new
    }
  end
end
