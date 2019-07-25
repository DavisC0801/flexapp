class ClientMailer < ApplicationMailer
  def clientmessage(message, client, email)
    @client = client
    @message = message
    mail(to: email, subject: "#{client.first_name.capitalize} has sent you a message via CalorieCoach")
  end
end
