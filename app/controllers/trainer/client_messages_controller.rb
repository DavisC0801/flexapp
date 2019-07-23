class Trainer::ClientMessagesController < Trainer::BaseController
  def new; end

  def create
    message = params[:message]
    client = Client.find(params[:client])
    send_number = "+1" + client.phone_num
    TwilioTextMessenger.new(message, send_number).call
    flash.notice = "Successfully Sent Message"
    redirect_to trainer_dashboard_path
  end
end
