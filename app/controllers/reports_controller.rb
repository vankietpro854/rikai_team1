class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:index, :edit, :destroy, :new, :show]
  before_action :correct_user,   only: [:destroy, :edit, :new]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = current_user.reports.build
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
      if @report.save
        flash[:success] = "Report was successfully create"
        redirect_to @report
      else
        flash[:danger] = "Report wasn't successfully create"
        render 'new'
      end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
      if @report.update(report_params)
        flash[:success] = "Report was successfully update"
        redirect_to @report
      else
        flash[:danger] = "Report wasn't successfully update"
        render 'new'
      end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
   Report.find(params[:id]).destroy
   flash[:success] = "Report deleted"
   redirect_to reports_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :user_id, :content)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @report = current_user.reports.find_by(id: params[:id])
      redirect_to reports_url if @report.nil?
    end
end
