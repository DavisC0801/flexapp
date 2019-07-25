class Trainer::TrainerMailersController < Trainer::BaseController
  def new
    @client = Client.find(params[:format])
  end

  def create
    body = params[:email]
    client = Client.find(params[:client])
    TrainerMailer.trainermessage(body, current_trainer, client).deliver_now
    flash[:success] = "Email Sent!"
    redirect_to trainer_dashboard_path
  end
end
