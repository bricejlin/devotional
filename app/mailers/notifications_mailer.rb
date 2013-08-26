class NotificationsMailer < ActionMailer::Base
  default from: "devotionallyapp@gmail.com"
  default to:   "devotionallyapp@gmail.com"

  def contact_us(message)
    @message = message
  	mail(subject: "Devotionally | #{@message.name} sent some feedback")
  end
end
