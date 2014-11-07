class PagesController < ApplicationController
  def trang_chu
  end

  def thue_may_game
    @products = Product.all
    @ships = Shipping.all
  end

  def danh_sach_game
    @products = Product.where(id: Console.select(:product_id).uniq )
  end

  def shop_thiet_bi
    @devices = Product.sellable
  end

  def chi_tiet_thiet_bi
    @detail = Product.find(params[:id])
  end

  def shop_giftcard

  end

  def cau_hoi_thuong_gap

  end

  def dat_thue
    quote = Quote.new(params.require(:quote).permit(:name, :phone, :address, :duration, :console_id, :note))
    quote.save

    redirect_to xac_nhan_yeu_cau_url
  end

  def xac_nhan_yeu_cau
    render layout: 'blank'
  end
end
