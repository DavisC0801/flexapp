class InviteMailer < ApplicationMailer
  def invite(trainer, email)
    @trainer = trainer
    mail(to: email, subject: "#{trainer.first_name.capitalize} has invited you to Join CalorieCoach")
  end
end
