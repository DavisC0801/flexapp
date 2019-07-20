class TrainersController < ApplicationController

  def new
  end

  def create
    user = User.create(trainer_info)
    user.update(role: 1)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def show
    @trainer = current_trainer
  end

  private
    def trainer_info
      params.require(:trainer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
