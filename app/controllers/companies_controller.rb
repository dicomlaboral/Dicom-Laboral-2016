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
  end

  def index
    @page_section = "dashboard"
  end

  def worker
    @worker = User.find(params[:id])
    @works = @worker.works
  end

  def workers

  end

  def workers_new

  end

  def work_data
    @work = Work.find(params[:id])
    render json: @work.as_json(include: :company)
  end

end
