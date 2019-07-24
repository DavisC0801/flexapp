class UsersController < ApplicationController
  def show
  end

  def new
    @client = Client.new
  end

  # client controller locked to a before action, routing client create action here.
  def create
    client = Client.create(client_info)
    if client.save
      trainer = Trainer.find_by(email: params[:trainer_email])
      if trainer.nil?
        flash[:failure] = "Unable to Find that Trainer. Please Try Again."
        redirect_to new_user_path
      else
        trainer.clients << client
        session[:client_id] = client.id
        redirect_to client_dashboard_path
      end
    else
      flash[:failure] = client.errors.full_messages.first
      redirect_to new_user_path
    end
  end


  private
    def client_info
      params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
