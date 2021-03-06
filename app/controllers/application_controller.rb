class ApplicationController < ActionController::Base
  helper_method :current_trainer, :current_client, :current_user

  def current_trainer
    @current_trainer ||= Trainer.find(session[:trainer_id]) if session[:trainer_id]
  end

  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]
  end

  def current_user
    current_client || current_trainer
  end
end
