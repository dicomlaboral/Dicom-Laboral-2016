class WorksController < InheritedResources::Base

  private

    def work_params
      params.require(:work).permit(:start_date, :end_date, :comment_user, :comment_company, :user_id, :company_id)
    end
end

