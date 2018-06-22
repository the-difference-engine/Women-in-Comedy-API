class AdminMailer < ActionMailer::Base
  default from: 'womenincomedy@gmail.com'

  default template_path: 'admin_mailer'
  def email_all_users(email)
    
    @users = User.all.collect(&:email)
    
    mail(to: @users, subject: 'Message from the admin', body: email, content_type: 'text/html')
    
  end

end
