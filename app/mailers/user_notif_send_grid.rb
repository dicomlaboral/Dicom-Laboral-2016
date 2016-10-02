class UserNotifSendGrid < ApplicationMailer
  default :from => 'info@dicomlaboralcl.com'
  # send a signup email to the user, pass in the user object that  contains the user's email address
  def send_signup_email(user)
    @user = user
    #mail(:to => @user.email,
    mail(:to => @user,
      :subject => 'Thanks for signing up for our amazing app')
  end

  def send_work_from_user_email(usercompany, user, company, work)
    @usercompany = usercompany
    @user = user
    @company = company
    @work = work
    #mail(:to => @user.email,
    mail(:to => @usercompany.email,
      :subject => 'Nueva relación laboral desde usuario')
  end

  def send_work_from_company_email(user, company, work)
    @user = user
    @company = company
    @work = work
    #mail(:to => @user.email,
    mail(:to => @user.email,
      :subject => 'Nueva relación laboral desde empresa')
  end
end
