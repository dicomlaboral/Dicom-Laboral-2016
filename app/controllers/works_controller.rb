class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    @company = Company.find(params[:company_id])
    @works = @company.works
    #@works = Work.all
  end

  def index2
    @user = User.find(params[:user_id])
    @works = @user.works
    #@works = Work.all
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    if params[:from] == 'EMPRESA'
      @work = Work.new #(work_params2)
      @work.user_id = params[:id]
      @work.from = params[:from]
      @work.comment_company = params[:comments]
      @work.start_date = params[:startdate]
      @work.end_date = params[:enddate]
      @work.company_id = current_usercompany.company_id
      @work.save
      redirect_to companies_path
    else
      @work = Work.new #(work_params2)
      @work.user_id = current_user.id
      @work.from = params[:from]
      @work.comment_user = params[:comments]
      @work.start_date = params[:startdate]
      @work.end_date = params[:enddate]
      @work.company_id = params[:id]
      @work.save
      redirect_to users_path
    end
    # @from = 'EMPRESA'
    # respond_to do |format|
    #   if @work.save
    #     format.html { redirect_to @work, notice: 'Work was successfully created.' }
    #     format.json { render :show, status: :created, location: @work }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @work.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:start_date, :end_date, :comment_user, :comment_company, :user_id, :company_id, :from)
    end

    def work_params2
      params.require(:work).permit(:startdate, :enddate, :comments, :id, :from)
    end
end
