class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    if params['Trainer']
      trainer = Trainer.create(trainer_info)
      if trainer.save
        session[:trainer_id] = trainer.id
        redirect_to trainer_dashboard_path
      else
        flash[:failure] = 'Missing or Invalid Credentials'
        redirect_to register_path
      end
    elsif params['Client']
      client = Client.create(client_info)
      if client.save
        trainer = Trainer.find_by(email: params[:user][:trainer_email])
        trainer.clients << client
        session[:client_id] = client.id
        redirect_to client_dashboard_path
      else
        flash[:failure] = 'Missing or Invalid Credentials'
        redirect_to register_path
      end
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
