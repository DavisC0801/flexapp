class Clients::TrainerMessagesController < Clients::BaseController
  def new; end

  def create
    message = params[:message]
    send_number = "+1" + current_client.trainer.phone_num
    TwilioTextMessenger.new(message, send_number).call
    flash.notice = "Successfully Sent Message"
    redirect_to client_dashboard_path
  end
end
