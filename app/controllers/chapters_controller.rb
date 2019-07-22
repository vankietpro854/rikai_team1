class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :destroy, :new]
  before_action :admin_user,     only: [:index, :edit, :destroy, :new]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapters = Chapter.all
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

      if @chapter.save
        flash[:success] = "Tạo chương thành công"
        redirect_to @chapter
      else
        flash[:danger] = "Tạo chương không thành công"
        render 'new'
      end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
      if @chapter.update(chapter_params)
        flash[:success] = "Chỉnh sửa chương thành công"
        redirect_to @chapter
      else
        flash[:danger] = "Chỉnh sửa chương không thành công"
        render 'new'
      end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    Chapter.find(params[:id]).destroy
    flash[:success] = "Chapter deleted"
    redirect_to chapters_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :content, :cour_id)
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
