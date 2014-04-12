class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @need = Need.find(params[:need_id]).organization.name
    # @organization = @need.organization
  end

  def create
    @need = Need.find(params[:id])
    @donation = Donation.new(donations_params)
    if @donation.save
      redirect_to @donation
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end


private
  def donations_params
    params.require(:donation).permit(:good_id)
  end
end
