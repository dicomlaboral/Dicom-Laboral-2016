class CompaniesController < ApplicationController
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

  def workers_new

  end

  def work_data
    @work = Work.find(params[:id])
    render json: @work.as_json(include: :company)
  end

end
