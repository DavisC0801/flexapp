class Trainer::DashboardController < ApplicationController
  def show
    @trainer = current_trainer
  end
end
