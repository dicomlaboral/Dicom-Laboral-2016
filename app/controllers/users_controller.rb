class UsersController < ApplicationController
  def search
    # @user = User.where("dni = ?", params[:rut])
    # @user = User.find_by("dni = ?", params[:rut])
    # @user = User.joins(:works).where("dni = ? and company_id = 2", params[:rut]).first
    # @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, works.*")
    # @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, count(works) as work_count").group(:works)
    # @user = User.joins("LEFT JOIN works ON users.id = works.user_id and works.company_id = 9").where("users.dni = '" + params[:rut] + "'").select("users.*, works.*").first
    #@company = Company.joins("LEFT JOIN works ON companies.id = works.company_id and works.user_id = #{current_user.user_id}").where("companies.rut = '" + params[:rut] + "'").first
    @company = Company.joins("LEFT JOIN works ON companies.id = works.company_id").where("companies.rut = '" + params[:rut] + "'").first
    if @company.present?
      @work = @company.works.where("user_id = #{current_user.id}")
    end
  end

  def addworker
    @company = Company.find(params[:id])
    @user = User.find(current_user.id)
    @from = 'PERSONA'
  end

  def worker
    @worker = Company.find(params[:id])
    @works = @worker.works
  end
end
