class Admin::ContractsController < Admin::BaseController
  before_filter :require_login

  def index
    @contracts = Contract.order('created_at DESC')
  end

  def new
    @contract = Contract.new
    @contract.build_client
    @contract.items.new

    if params[:quote_id].present?
      @quote = Quote.find(params[:quote_id])
      @contract.client.copy(@quote)
      @contract.duration = @quote.duration
    end
  end

  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        if params[:quote_id].present?
          @quote = Quote.find(params[:quote_id])
          @quote.complete
        end
        format.html { redirect_to [:admin, :contracts], success: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html { @contract = Contract.find(params[:id]) }
      format.pdf do
        @contract = Contract.find(params[:id])
        render :pdf => "HopDongSo" +@contract.number, 
                :layout => false, 
                :margin => {:top => 5, :bottom => 10, :left => 10, :right => 10},
                :show_as_html => params[:debug]
      end
    end
  end

  def record
    respond_to do |format|
      format.html { @contract = Contract.find(params[:rid]) }
      format.pdf do
        @contract = Contract.find(params[:id])
        render :pdf => "BienBanSo" +@contract.number, 
                :layout => false, 
                :margin => {:top => 1, :bottom => 10, :left => 10, :right => 10},
                :show_as_html => params[:debug]
      end
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end

  def update
    @contract = Contract.find(params[:id])

    respond_to do |format|
      if @contract.update_attributes(contract_params)
        format.html { redirect_to [:admin, @contract], success: 'Contract was successfully updated.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contract = Contract.find(params[:id])

    @contract.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :contracts], success: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contract_params
    params.require(:contract).permit!
  end
end