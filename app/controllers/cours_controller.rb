class CoursController < ApplicationController
  before_action :set_cour, only: [:show, :edit,:update]
  before_action :logged_in_user, only: [:index, :edit, :destroy, :new]
  before_action :admin_user,     only: [:edit, :destroy, :new]

  # GET /cours.json
  def index
    @cours = if params[:timkiem]
      Cour.where('name LIKE ?', "%#{params[:timkiem]}%")
    else
      @cours = Cour.all
    end
  end

  # GET /cours/1
  # GET /cours/1.json
  def show
    @chapters = Chapter.all
  end

  # GET /cours/new
  def new
    @cour = Cour.new
  end

  # GET /cours/1/edit
  def edit
  end

  # POST /cours
  # POST /cours.json
  def create
    @cour = Cour.new(cour_params)
      if @cour.save
        flash[:success] = "Thêm khóa học thành công"
        redirect_to @cour
      else
        flash[:danger] = "Thêm khóa học không thành công"
        render 'new'
      end
  end

  # PATCH/PUT /cours/1
  # PATCH/PUT /cours/1.json
  def update
      if @cour.update(cour_params)
        flash[:success] = "Chỉnh sửa khóa học thành công"
        redirect_to @cour
      else
        flash[:danger] = "Chỉnh sửa khóa học không thành công"
        render 'new'
      end
  end

  # DELETE /cours/1
  # DELETE /cours/1.json
  def destroy
    Cour.find(params[:id]).destroy
    flash[:success] = "Đăng ký khóa học deleted"
    redirect_to cours_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cour
      @cour = Cour.find_by(id: [params[:id], params[:cour_id]])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cour_params
      params.require(:cour).permit(:name,:image_cours, :content, :time_learn, :term)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
