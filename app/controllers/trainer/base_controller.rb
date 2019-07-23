class Trainer::BaseController < ApplicationController
  before_action :require_trainer

  def require_trainer
    render status: 404, file: "#{Rails.root}/public/404.html" if !current_trainer
  end
end
