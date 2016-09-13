class CompaniesController < ApplicationController
  before_action :authenticate_usercompany!

  def register
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

  # def workers_new
  # end

  def addworker
    @company = Company.find(current_usercompany.company_id)
    @user = User.find(params[:id])
    @from = 'EMPRESA'
  end

  def work_data
    @work = Work.find(params[:id])
    render json: @work.as_json(include: :company)
  end

end
