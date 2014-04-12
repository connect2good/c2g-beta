class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @need = Need.find(params[:need_id]).organization.name
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donations_params)
    if @donation.save
      redirect_to @donation
    else
      render 'new'
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end


private
  def donations_params
    params.require(:donation).permit(:pic1, :pic2, :pic3)
  end
end
