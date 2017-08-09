class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
  def new_user(user)

    @first_name = user.first_name
    @last_name = user.last_name
    @url = 'http://localhost:3000/form'
    mail to: user.email, subject: 'Welcome to Women In Comedy!'
  end
end
