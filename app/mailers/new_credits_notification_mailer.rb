class NewCreditsNotificationMailer < ApplicationMailer
  def send_notification(user, credit)
    @credit = credit

    mail to: user.email, subject: 'New credit'
  end
end
