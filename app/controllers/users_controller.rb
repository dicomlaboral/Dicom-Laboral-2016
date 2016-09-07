class UsersController < ApplicationController
  def search
  	# @user = User.where("dni = ?", params[:rut])
  	# @user = User.find_by("dni = ?", params[:rut])
  	# @user = User.joins(:works).where("dni = ? and company_id = 2", params[:rut]).first
  	# @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, works.*")
  	# @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, count(works) as work_count").group(:works)
  	@user = User.joins("LEFT JOIN works ON users.id = works.user_id and works.company_id = 9").where("users.dni = '" + params[:rut] + "'").select("users.*, works.*").first
  end
end
