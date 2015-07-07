class StackMailer < ActionMailer::Base
  default from: "admin@stack.com"

  def new_user_confirmation(user)
    @user = user
    mail to: user.email, subject: "New User Confirmation"
  end
end
