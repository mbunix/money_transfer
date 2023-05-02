class Api::V1::ReportsController < ApplicationController
  def new
  end
    def create
    start_date = params[:start_date].to_date
    end_date = params[:end_date].to_date
    @transactions = current_user.transactions
                                 .where('created_at >= ? AND created_at <= ?', start_date, end_date)
    ReportMailer.report_email(current_user, @transactions).deliver_now
    redirect_to root_path, notice: 'Report has been sent!'
    Report.generate(current_user, params[:days])
    flash[:notice] = "Your report has been generated and sent to your email"
    redirect_to root_path
  end
  
end
