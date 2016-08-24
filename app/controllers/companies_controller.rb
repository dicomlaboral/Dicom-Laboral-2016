class CompaniesController < ApplicationController
  def register
  	@company = Company.new
  end

  def create
		@company = Company.new(company_params)
    @company.save
  end

  def company_params
	  params.require(:company).permit(:name, :rut, :phone, :address, :activity)
	end

  def dashboard
    
  end
end
