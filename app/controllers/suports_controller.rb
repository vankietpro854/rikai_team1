class SuportsController < ApplicationController
  before_action :set_suport, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :destroy]
  before_action :admin_user,     only: [:index, :edit, :destroy]

  # GET /suports
  # GET /suports.json
  def index
    @suports = Suport.all
  end

  # GET /suports/1
  # GET /suports/1.json
  def show
  end

  # GET /suports/new
  def new
    @suport = Suport.new
  end

  # GET /suports/1/edit
  def edit
  end

  # POST /suports
  # POST /suports.json
  def create
    @suport = Suport.new(suport_params)

      if @suport.save
        flash[:success] = "Thank you for respond."
        render 'show'
      else
        flash[:danger] = "User wasn't successfully respond"
        render 'new'
      end
  end

  # PATCH/PUT /suports/1
  # PATCH/PUT /suports/1.json
  def update
    respond_to do |format|
      if @suport.update(suport_params)
        format.html { redirect_to @suport, notice: 'Suport was successfully updated.' }
        format.json { render :show, status: :ok, location: @suport }
      else
        format.html { render :edit }
        format.json { render json: @suport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suports/1
  # DELETE /suports/1.json
  def destroy
    @suport.destroy
    respond_to do |format|
      format.html { redirect_to suports_url, notice: 'Suport was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suport
      @suport = Suport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suport_params
      params.require(:suport).permit(:name, :emai, :subject, :message)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(suport_path) unless current_user.admin?
    end
end
