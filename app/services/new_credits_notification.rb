class NewCreditsNotification
  def send_notification(user, credit)
    NewCreditsNotificationMailer.send_notification(user, credit).deliver_later
  end
end
