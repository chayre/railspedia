class UserMailer < ApplicationMailer
    
    def thank_you_email(user)
      @user = user
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Your flight has been booked!')
    end
  
end
