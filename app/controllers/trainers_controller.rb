class TrainersController < ApplicationController
  def show
    @trainer = current_user
  end
end
