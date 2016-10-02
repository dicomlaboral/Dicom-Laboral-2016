class HomeController < ApplicationController
  include Devise::Controllers::Helpers
  layout "front_end"
  
  def index
    
  end

  def user
  end

  def register_usercompanies
  end

  def create_user_companies
    @company_name = params[:name]
    @company_rut = params[:rut]
    @company_phone = params[:phone]
    @company_address = params[:address]
    @company_activity = params[:activity]
    @company_description = params[:description]
    @company_logo = params[:logo]

    @usercompany_email = params[:email]
    @usercompany_dni = params[:dni]
    @usercompany_firstname = params[:firstname]
    @usercompany_lastname = params[:lastname]
    @usercompany_photo = params[:photo]

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity)
    @company.save

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity, description: @company_description, logo: @company_logo)

    @usercompany = Usercompany.new(firstname: @usercompany_firstname, lastname: @usercompany_lastname, photo: @usercompany_photo, company: @company, email: @usercompany_email , password: "123456", dni: @usercompany_dni )

    if @company.save and @usercompany.save
      redirect_to root_path
    else
      flash[:notice] = "Error al crear la empresa"
      redirect_to home_register_usercompanies_path
    end

  end

  def workfromcompany
    @idw = params[:idw]
    @work = Work.find(@idw)
    @company = Company.find(@work.company_id)
    @user = User.find(@work.user_id)
  end

  def workfromuser
    @idw = params[:idw]
    @work = Work.find(@idw)
    @user = User.find(@work.user_id)
    @company = Company.find(@work.company_id)
  end
end
