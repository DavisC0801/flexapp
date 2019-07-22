class SessionsController < ApplicationController
  def create
    if Client.find_by(email: params[:email])
      client = Client.find_by(email: params[:email])
      if client&.authenticate(params[:password])
        session[:client_id] = client.id
        redirect_to client_dashboard_path
      end
    end
  end
end
