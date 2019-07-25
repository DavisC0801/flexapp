class Clients::ClientMailersController < Clients::BaseController
  def new
    @trainer = current_user.trainer
  end

  def create
    body = params[:email]
    ClientMailer.clientmessage(body, current_user, current_user.trainer.email).deliver_now
    flash[:success] = "Email Sent!"
    redirect_to client_dashboard_path
  end
end
