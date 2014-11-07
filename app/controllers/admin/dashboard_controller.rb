class Admin::DashboardController < Admin::BaseController
	before_filter :require_login
  def show

  end

end