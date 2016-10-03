class UsercompaniesController < ApplicationController
  def edit
  	@company = Company.find(current_usercompany.company_id)
  	@user = Usercompany.find(current_usercompany.id)
  end

  def update
  	@user = Usercompany.find(current_usercompany.id)
    @user.dni = params[:dni]
    @user.firstname = params[:firstname]
    @user.lastname = params[:lastname]
    @user.phone = params[:phone]
    @user.birthday = params[:birthday]
    @user.save
    redirect_to edit_usercompany_path(current_usercompany.id)
  end
end
