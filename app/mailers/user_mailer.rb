class UserMailer < ApplicationMailer
  default from: "mathieu_chiron@yahoo.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
    :to => 'mathieu1chiron@gmail.com',
    :subject => "Holy cow!! its a new message from #{name}")
  end
end
