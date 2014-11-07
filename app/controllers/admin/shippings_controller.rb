class Admin::ShippingsController < Admin::BaseController
	before_filter :require_login
	before_action :set_admin_shipping, only: [:show, :edit, :update, :destroy]
	
	def index
		@admin_shippings = Shipping.all
	end

	def show
		
	end

	def new
		@admin_shipping = Shipping.new
	end

	def create
		@admin_shipping = Shipping.new(shipping_params)
		if @admin_shipping.save
			redirect_to admin_shippings_path
		else
			render new_admin_shipping_path
		end
	end

	def update
		if @admin_shipping.update(shipping_params)
			redirect_to admin_shippings_path
		else
			render edit_admin_shipping_path
		end
	end

	def destroy
		@admin_shipping.destroy
		redirect_to admin_shippings_path
	end

	private

	def set_admin_shipping
		@admin_shipping  = Shipping.find(params[:id])
	end

	def shipping_params
    params.require(:shipping).permit(:name, :price)
  end

end