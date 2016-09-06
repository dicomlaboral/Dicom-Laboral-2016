class UsersController < ApplicationController
  def search
  	# @user = User.where("dni = ?", params[:rut])
  	# @user = User.find_by("dni = ?", params[:rut])
  	# @user = User.joins(:works).where("dni = ? and company_id = 2", params[:rut]).first
  	# @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, works.*")
  	# @user = User.joins("LEFT JOIN works ON users.id = works.user_id").select("users.*, count(works) as work_count").group(:works)
  	@user = User.joins("LEFT JOIN works ON users.id = works.user_id AND dni = '" + params[:rut] + "' AND company_id = 2").select("users.*, works.*").first
  end
end
