class Trainer::DashboardController < Trainer::BaseController
  def show
    @trainer = current_trainer
  end
end
