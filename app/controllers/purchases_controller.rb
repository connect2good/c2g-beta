class PurchasesController < ApplicationController
  before_action :authenticate_individual!

  def index
  end

  def new
    @merchandise = Merchandise.find(params[:merchandise_id])
    @purchase = @merchandise.offers.new
  end

  def create
    @merchandise = Merchandise.find(params[:merchandise_id])
    @purchase = @merchandise.offers.new(purchase_params)
    @purchase.status = "sold"
    @purchase.buyer_id = current_individual.id
    if @purchase.save
      @merchandise.sold = true
      @merchandise.save!
      redirect_to merchandises_path, notice: "Thank you for your purchase! You will receive a confirmation email shortly."
      Notifier.buyer_confirmation(@purchase).deliver
      Notifier.seller_confirmation(@purchase).deliver
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
      :agree,
      :buyer_id)
  end
end
