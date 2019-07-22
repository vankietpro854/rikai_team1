class DetailCoursesController < ApplicationController
  before_action :set_detail_course, only: [:show, :edit,:update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :destroy, :new, :show]
  before_action :admin_user,     only: [:index, :edit, :destroy, :new, :show]
  # GET /detail_courses
  # GET /detail_courses.json
  def index
    @detail_courses = DetailCourse.all
  end

  # GET /detail_courses/1
  # GET /detail_courses/1.json
  def show
  end

  # GET /detail_courses/new
  def new
    @detail_course = current_user.detail_courses.build
  end

  # GET /detail_courses/1/edit
  def edit
  end

  # POST /detail_courses
  # POST /detail_courses.json
  def create
    @detail_course = DetailCourse.new(detail_course_params)
      if @detail_course.save
        flash[:success] = "Đăng ký khóa học thành công"
        redirect_to @detail_course
      else
        flash[:danger] = "Đăng ký khóa học không thành công"
        render 'new'
      end
  end

  # PATCH/PUT /detail_courses/1
  # PATCH/PUT /detail_courses/1.json
  def update
      if @detail_course.update(detail_course_params)
        flash[:success] = "Thay đổi đăng ký khóa học thành công"
        redirect_to @detail_course
      else
        flash[:danger] = "Thay đổi đăng ký khóa học không thành công"
        render 'new'
      end
  end

  # DELETE /detail_courses/1
  # DELETE /detail_courses/1.json
  def destroy
    DetailCourse.find(params[:id]).destroy
    flash[:success] = "Đăng ký khóa học deleted"
    redirect_to detail_courses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_course
      @detail_course = DetailCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_course_params
      params.require(:detail_course).permit(:user_id, :cour_id, :begin, :end)
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
