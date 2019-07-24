class TrainersController < ApplicationController
  def new
  end

  def create
    trainer = Trainer.create(trainer_info)
    if trainer.save
      session[:trainer_id] = trainer.id
      redirect_to trainer_dashboard_path
    else
      flash[:failure] = 'Missing or Invalid Credentials'
      redirect_to register_path
    end
  end

  private

  def trainer_info
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
