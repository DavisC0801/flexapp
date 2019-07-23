class Trainer::BaseController < ApplicationController
  before_action :require_trainer

  def require_trainer
    raise ActionController::RoutingError.new('Not Found') if !current_trainer
  end
end
