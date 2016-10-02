class HomeController < ApplicationController
  include Devise::Controllers::Helpers
  layout "front_end"
  
  def index
    @all_workers = []
    @the_worker = {}
    @top_3_workers = []

    @user = User.all
    @user.each do |user|
      @workers = user.works.count
      @works = user.works #.where("\"from\" = 'EMPRESA'")
      @sum = 0
      @cant = 0
      @prom = 0
      @works.each do |work|
        @rating = work.ratingusers.average(:value)
        if not(@rating.blank?)
          @sum = @sum + @rating
          @cant = @cant + 1
        end
      end
      if @cant > 0
        @prom = (@sum/@cant).round
      end

      full_name = "#{user.firstname} " " #{user.lastname}"

      # Creamos un HASH con la info del usuario
      @the_worker = {name: full_name, email: user.email, photo: user.photo.url, prom: @prom}

      # Pusheamos el HASH al ARRAY
      @all_workers.push(@the_worker)
    end

    # Seleccionamos solo los 5 Workers con mejor promedio
    @top_3_workers = @all_workers.group_by{ |r| r[:prom] }.sort_by{ |k, v| -k }.take(2).map(&:last).flatten
  end

  def user
  end

  def register_usercompanies
  end

  def create_user_companies
    @company_name = params[:name]
    @company_rut = params[:rut]
    @company_phone = params[:phone]
    @company_address = params[:address]
    @company_activity = params[:activity]
    @company_description = params[:description]
    @company_logo = params[:logo]

    @usercompany_email = params[:email]
    @usercompany_dni = params[:dni]
    @usercompany_firstname = params[:firstname]
    @usercompany_lastname = params[:lastname]
    @usercompany_photo = params[:photo]

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity)
    @company.save

    @company = Company.new(name: @company_name, rut: @company_rut, phone: @company_phone, address: @company_address, activity: @company_activity, description: @company_description, logo: @company_logo)

    @usercompany = Usercompany.new(firstname: @usercompany_firstname, lastname: @usercompany_lastname, photo: @usercompany_photo, company: @company, email: @usercompany_email , password: "123456", dni: @usercompany_dni )

    if @company.save and @usercompany.save
      redirect_to root_path
    else
      flash[:notice] = "Error al crear la empresa"
      redirect_to home_register_usercompanies_path
    end

  end

  def workfromcompany
    @idw = params[:idw]
    @work = Work.find(@idw)
    @company = Company.find(@work.company_id)
    @user = User.find(@work.user_id)
  end

  def workfromuser
    @idw = params[:idw]
    @work = Work.find(@idw)
    @user = User.find(@work.user_id)
    @company = Company.find(@work.company_id)
  end
end
