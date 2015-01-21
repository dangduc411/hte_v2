class Admin::ConsolesController < Admin::BaseController
  before_filter :require_login
  before_action :set_admin_console, only: [:show, :edit, :update, :destroy]

  def index
    @admin_consoles = Console.all
  end

  def show
  end

  def new
    @admin_console = Console.new
  end

  def edit
  end

  def create
    @admin_console = Console.new admin_console_params

    respond_to do |format|
      if @admin_console.save
        format.html { redirect_to [:admin, :consoles], success: 'Console was successfully created.' }
        format.json { render :show, status: :created, location: @admin_console }
      else
        format.html { render :new }
        format.json { render json: @admin_console.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_console.update(admin_console_params)
        format.html { redirect_to [:admin, :consoles], success: 'Console was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_console }
      else
        format.html { render :edit }
        format.json { render json: @admin_console.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_console.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :consoles], success: 'Console was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_admin_console
    @admin_console = Console.find(params[:id])
  end

  def admin_console_params
    params.require(:console).permit(:product_id, :name, :slug, :available, :game_ids => [])
  end
end
