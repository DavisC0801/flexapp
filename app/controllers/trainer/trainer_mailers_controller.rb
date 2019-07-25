class Trainer::TrainerMailersController < Trainer::BaseController
  def new
    @client = Client.find(params[:format])
  end

  def create
    body = params[:email]
    client = Client.find(params[:client])
    if body.nil? || body.empty?
      flash[:error] = "Email Cannot be Blank. Please Try Again."
      redirect_to trainer_mailers_new_path
    else
      TrainerMailer.trainermessage(body, current_trainer, client).deliver_now
      flash[:success] = "Email Sent!"
      redirect_to trainer_dashboard_path
    end
  end
end
