class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    trainer = User.find_by(email: params["user"]["trainer_email"])
    client = User.create(client_info)
    binding.pry
    trainer.clients.create(client: client)
    client.update(role: 0)
    session[:user_id] = client.id
    redirect_to dashboard_path
  end

  private
    def client_info
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
