class Admin::QuotesController < Admin::BaseController
  before_filter :require_login
  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def cancel
    @quote = Quote.find(params[:id])
    @quote.cancel

    redirect_to admin_quote_path(@quote)
  end
end