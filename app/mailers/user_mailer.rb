class UserMailer < Devise::Mailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_user.subject
  #
  default template_path: 'devise/mailer'
  def new_user(user)
    @email = user.email

    mail to: user.email, subject: 'Welcome to Women In Comedy!'
  end
end
