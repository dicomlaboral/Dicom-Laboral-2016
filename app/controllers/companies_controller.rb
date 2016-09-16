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

  def workerrating
    @work = Work.find(params[:id])
    @worker = User.find(@work.user_id)
    @type = Type.where("name = 'PERSONA'").first
    @template = Template.where("type_id = #{@type.id}").first
    @categories = Category.where("template_id = #{@template.id}").order("\"order\" ASC")
  end

  def addworkerrating
    @work = Work.find(params[:id])
    # @worker = User.find(params[:id])
    @type = Type.where("name = 'PERSONA'").first
    @template = Template.where("type_id = #{@type.id}").first
    @categories = Category.where("template_id = #{@template.id}").order("\"order\" ASC")
    @categories.each do |category|
      @ratinguser = Ratinguser.new
      @ratinguser.work_id = params[:id]
      @ratinguser.category_id = category.id
      @ratinguser.value = params["category_#{category.id}"]
      @ratinguser.save
    end
    redirect_to companies_path
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

  def search
    # @user = User.where("dni = ?", params[:rut])
    # @user = User.find_by("dni = ?", params[:rut])
    # @user = User.joins(:works).where("dni = ? and company_id = 2", params[:rut]).first
    # @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, works.*")
    # @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, count(works) as work_count").group(:works)
    # @user = User.joins("LEFT JOIN works ON users.id = works.user_id and works.company_id = 9").where("users.dni = '" + params[:rut] + "'").select("users.*, works.*").first
    @user = User.joins("LEFT JOIN works ON users.id = works.user_id").where("users.dni = '" + params[:rut] + "'").first
    if @user.present?
      @work = @user.works.where("company_id = #{current_usercompany.company_id}")
    end
  end

end
