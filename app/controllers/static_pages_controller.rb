class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:admin]
  before_action :admin_user,     only: :admin

  def home
  end

  def help
  end

  def admin
    @users = User.all # not paginated
    @users = User.paginate(page: params[:page]) # paginated
  end

  private
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
