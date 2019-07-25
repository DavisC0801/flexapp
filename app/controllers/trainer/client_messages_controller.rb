class Trainer::ClientMessagesController < Trainer::BaseController
  def new; end

  def create
    message = params[:message]
    if message.nil? || message.empty?
      flash[:error] = "Message Cannot be Blank. Please Try Again."
      redirect_to trainer_client_messages_new_path
    else
      client = Client.find(params[:format])
      send_number = "+1" + client.trainer.phone_num
      TwilioTextMessenger.new(message, send_number).call
      flash.notice = "Successfully Sent Message"
      redirect_to trainer_dashboard_path
    end
  end
end
