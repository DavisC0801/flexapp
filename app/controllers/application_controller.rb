class ApplicationController < ActionController::Base
  def current_trainer
    @current_trainer ||= Trainer.find(session[:trainer_id]) if session[:trainer_id]
  end

  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]
  end
end
