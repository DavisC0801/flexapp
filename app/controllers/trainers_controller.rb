class TrainersController < ApplicationController
  def show
    @trainer = current_trainer
  end
end
