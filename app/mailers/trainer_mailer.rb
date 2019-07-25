class TrainerMailer < ApplicationMailer
  def trainermessage(message, trainer, client)
    @trainer = trainer
    @message = message
    @client = client
    mail(to: client.email, subject: "#{trainer.first_name.capitalize} has sent you a message via CalorieCoach")
  end
end
