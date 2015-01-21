class Admin::ProductsController < Admin::BaseController
  before_filter :require_login
  before_action :set_admin_product, only: [:show, :edit, :update, :destroy]

  def index
    @admin_products = Product.all
  end

  def show
  end

  def new
    @admin_product = Product.new
  end

  def edit
  end

  def create
    @admin_product = Product.new(product_params)

    respond_to do |format|
      if @admin_product.save
        format.html { redirect_to [:admin, :products], success: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @admin_product }
      else
        format.html { render :new }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_product.update(product_params)
        format.html { redirect_to [:admin, :products], success: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :edit }
        format.json { render json: @admin_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_product.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :products], success: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_product
      @admin_product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :slug, :rental_price, :selling_price, :deposit_price, :sales_price, :product_photo, :remote_product_photo_url, :remove_product_photo, :long_name, :pack1_price, :pack2_price, :pack3_price, :sellable, :sell_name)
    end
    
    #def not_authenticated
      #redirect_to admin_login_path, alert: "Please login first"
    #end
end
