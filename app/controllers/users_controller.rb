class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    if params['Trainer']
      trainer = Trainer.create(trainer_info)
      session[:trainer_id] = trainer.id
      redirect_to trainer_dashboard_path
    end
  end

  private
    def client_info
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def trainer_info
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
