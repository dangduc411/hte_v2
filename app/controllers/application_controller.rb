class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types :error, :warning, :success, :info

  private
  
  def not_authenticated
      redirect_to admin_login_path, alert: "Please login first"
  end
end
