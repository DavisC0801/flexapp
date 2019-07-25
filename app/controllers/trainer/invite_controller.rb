class Trainer::InviteController < Trainer::BaseController
  def new
  end

  def create
    trainer = current_trainer
    InviteMailer.invite(trainer, params[:email]["Client Email"]).deliver_now
    flash[:success] = "Email Sent!"
    redirect_to trainer_dashboard_path
  end
end
