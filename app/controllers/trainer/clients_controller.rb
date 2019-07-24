class Trainer::ClientsController < ApplicationController
  def show
    @client = Client.find(params[:id])
  end

  def new
    @trainer = Trainer.find(params[:trainer])
  end

  def create
    trainer = Trainer.find_by(email: params[:client][:trainer_email])
    binding.pry
    client = trainer.clients.create(client_info)
    session[:client_id] = client.id
    redirect_to client_dashboard_path
  end

  private
    def client_info
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
