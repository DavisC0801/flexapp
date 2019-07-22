class ApplicationController < ActionController::Base
  helper_method :current_trainer, :current_client, :current_user, :require_client

  def current_trainer
    @current_trainer ||= Trainer.find(session[:trainer_id]) if session[:trainer_id]
  end

  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]
  end

  def current_user
    current_client || current_trainer
  end

  def require_client
    unless current_client
      render status: 404, file: "#{Rails.root}/public/404.html" 
    end
  end
end
