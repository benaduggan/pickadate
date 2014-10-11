class UserMailer < ActionMailer::Base
  default from: "pick@a-date.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://happy-fun-time-27279.use1.nitrousbox.com/"
    mail(to: @user.email, subject: 'Welcome to the Pick-A-Date Site!')
  end
  
end
