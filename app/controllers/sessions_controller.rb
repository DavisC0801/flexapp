class SessionsController < ApplicationController
  def create
    if Client.find_by(email: params[:email])
      client = Client.find_by(email: params[:email])
      if client&.authenticate(params[:password])
        session[:client_id] = client.id
        redirect_to client_dashboard_path
      else
        flash[:warning] = "Invalid Username/Password Combination!"
        redirect_to root_path
      end
    elsif Trainer.find_by(email: params[:email])
      trainer = Trainer.find_by(email: params[:email])
      if trainer&.authenticate(params[:password])
        session[:trainer_id] = trainer.id
        redirect_to trainer_dashboard_path
      else
        flash[:warning] = "Invalid Username/Password Combination!"
        redirect_to root_path
      end
    else
      flash[:failure] = 'Invalid Email'
      redirect_to root_path
    end
  end

  def destroy
    session[:client_id] = nil
    session[:trainer_id] = nil
    redirect_to '/'
  end

  def google_oauth
    oauth = request.env["omniauth.auth"]
    if Client.find_by(email: oauth['info']['email'])
      client = Client.find_by(email: oauth['info']['email'])
      session[:client_id] = client.id
      redirect_to client_dashboard_path
    elsif Trainer.find_by(email: oauth['info']['email'])
      trainer = Trainer.find_by(email: oauth['info']['email'])
      session[:trainer_id] = client.id
      redirect_to trainer_dashboard_path
    else
      redirect_to register_path
      flash[:failure] = "Could not find a matching account, please register here"
    end
  end
end
