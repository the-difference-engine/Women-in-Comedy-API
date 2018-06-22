class AdminMailer < ActionMailer::Base
  default from: 'womenincomedy@gmail.com'

  default template_path: 'admin_mailer'
  def email_all_users(email)
    # @users = User.all
    # @users.each do |user|
    #  mail(to: user.email, subject: 'Testing ')
    # end
    # used with personal email, works!
    @users = ['first@example.com', 'second@example.com', 'third@example.com']
    
    mail(to: @users, subject: 'testing', body: email, content_type: 'text/html')
    
  end

end
