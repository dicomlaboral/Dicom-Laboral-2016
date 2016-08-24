class CompaniesController < ApplicationController
  def register
  end

  def create
    @company_name = params[:name]
    @company_rut = params[:rut]
    @company_phone = params[:phone]
    @company_address = params[:address]
    @company_activity = params[:activity]

    @usercompany_email = params[:email]
    @usercompany_dni = params[:dni]
    @usercompany_firstname = params[:firstname]
    @usercompany_lastname = params[:lastname]

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity)
    @company.save

    @usercompany = Usercompany.new(email: @usercompany_email, dni: @usercompany_dni, firstname: @usercompany_firstname, lastname: @usercompany_lastname, company: @company, password: '123456')
    @usercompany.save
  end
end
