class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :user_signed_in?, :current_user

  private

  def not_found
    render file: "/public/404.html", status: 404, layout: false
  end

  # 使用者是否有登入
  def user_signed_in?
    # session[:user_token]
    current_user != nil
  end

  # 使用者是誰，沒有的話是nil
  def current_user
    @current_user ||= User.find_by(id: session[:user_token])
  end

  # 沒有登入自動轉址到登入頁面
  def authenticate_user!
    redirect_to root_path, notice: "請登入會員" if not user_signed_in?
  end
end
