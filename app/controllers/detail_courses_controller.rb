class DetailCoursesController < ApplicationController
  before_action :set_detail_course, only: [:show, :edit, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :new, :show]
  before_action :admin_user,     only: [:edit, :update, :destroy, :new]

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

    respond_to do |format|
      if @detail_course.save
        format.html { redirect_to @detail_course, notice: 'Detail course was successfully created.' }
        format.json { render :show, status: :created, location: @detail_course }
      else
        format.html { render :new }
        format.json { render json: @detail_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_courses/1
  # PATCH/PUT /detail_courses/1.json
  def update
    respond_to do |format|
      if @detail_course.update(detail_course_params)
        format.html { redirect_to @detail_course, notice: 'Detail course was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail_course }
      else
        format.html { render :edit }
        format.json { render json: @detail_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_courses/1
  # DELETE /detail_courses/1.json
  def destroy
    @detail_course.destroy
    respond_to do |format|
      format.html { redirect_to detail_courses_url, notice: 'Detail course was successfully destroyed.' }
      format.json { head :no_content }
    end
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
