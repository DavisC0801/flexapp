class TwilioTextMessenger
  def initialize(message, trainer_phone_num)
    @message = message
    @trainer_phone_num = trainer_phone_num
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: @trainer_phone_num,
      body: @message
    })
  end
end
