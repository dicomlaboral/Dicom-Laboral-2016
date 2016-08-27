class UsersController < ApplicationController
  def search
  	# @user = User.where("dni = ?", params[:rut])
  	@user = User.find_by("dni = ?", params[:rut])
  end
end
