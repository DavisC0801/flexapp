class Clients::TrainerMessagesController < Clients::BaseController
  def new; end

  def create
    message = params[:message]
    if message.nil? || message.empty?
      flash[:error] = "Message Cannot be Blank. Please Try Again."
      redirect_to trainer_messages_new_path
    else
      send_number = "+1" + current_client.trainer.phone_num
      TwilioTextMessenger.new(message, send_number).call
      flash.notice = "Successfully Sent Message"
      redirect_to client_dashboard_path
    end
  end
end
