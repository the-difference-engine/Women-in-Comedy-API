# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_user
  def new_user
    user = User.last
    UserMailer.new_user(user)
  end

end
