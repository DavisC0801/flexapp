class UsersController < ApplicationController
  def show
  end

  def new
  end

  # client controller locked to a before action, routing client create action here.
  def create
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


  private
    def client_info
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
