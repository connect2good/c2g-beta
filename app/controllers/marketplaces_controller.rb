class MarketplacesController < ApplicationController
  def index
  end

  def create
  end

  def new
    @marketplace = Marketplace.new
  end

  def show
  end

private
  def marketplaces_params
    params.require(:marketplace).permit(:good_id)
  end
end
