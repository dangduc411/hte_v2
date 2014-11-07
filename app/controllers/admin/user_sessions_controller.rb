class Admin::UserSessionsController <  Admin::BaseController
  def new
    @user = User.new
    render :layout => false#'admin'
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      redirect_back_or_to action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end
end