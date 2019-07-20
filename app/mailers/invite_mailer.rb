class InviteMailer < ApplicationMailer
  def invite(trainer, email)
    @trainer = trainer
    mail(to: email, subject: "#{trainer.first_name} has invited you to CalorieCoach")
  end
end
