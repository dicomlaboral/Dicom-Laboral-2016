class HomeController < ApplicationController
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

    @usercompany_email = params[:email]
    @usercompany_dni = params[:dni]
    @usercompany_firstname = params[:firstname]
    @usercompany_lastname = params[:lastname]

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity)
    @company.save

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity, description: @company_description)

    @usercompany = Usercompany.new(firstname: @usercompany_firstname, lastname: @usercompany_lastname, company: @company, email: @usercompany_email , password: "123456" )

    if @company.save and @usercompany.save
      redirect_to root_path
    else
      flash[:notice] = "Error al crear la empresa"
      redirect_to home_register_usercompanies_path
    end

  end

end
