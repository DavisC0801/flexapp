class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_trainer
    @current_trainer ||= Trainer.find(session[:trainer_id]) if session[:trainer_id]
  end
end
