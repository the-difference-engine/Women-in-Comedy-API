class AdminMailer < ActionMailer::Base
  default from: 'womenincomedy@gmail.com'

  default template_path: 'admin_mailer'
  def email_all_users
    # @users = User.all
    # @users.each do |user|
    #  mail(to: user.email, subject: 'Testing ')
    # end
    # used with personal email, works!
    @user = 'test@gmail.com'
    mail(to: @user, subject: 'testing')
  end

end
