class Admin::InventoryItemsController < Admin::BaseController
  before_filter :require_login
  before_action :set_admin_inventory_items, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index
    @inventory_items = InventoryItem.all
  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    @inventory_item = InventoryItem.new(inventory_items_params)

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to [:admin, :inventory_items], success: 'InventoryItem was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_items_params)
        format.html { redirect_to [:admin, :inventory_items], success: 'InventoryItem was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :inventory_items], success: 'InventoryItem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_inventory_items
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_items_params
      params.require(:inventory_item).permit(:name, :serial)
    end
end
