class PurchasesController < ApplicationController
  def index
  end

  def new
    @merchandise = Merchandise.find(params[:merchandise_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to merchandise_purchases_path
    else
      render "new"
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end


  private
  def purchase_params
    params.require(:purchase).permit(
      :merchandise_id,
      :status)
  end
end
