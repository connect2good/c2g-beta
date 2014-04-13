class DonationsController < ApplicationController
  def index
    @donations = Donation.all
  end

  def new
    @need = Need.find(params[:need_id])
    @need_name = @need_name = @need.organization.name
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donations_params)
    @donation.status = "pending"
    # Must update need_id dynamically
    @donation.need_id = 3
    # Must update donor_id dynamically
    @donation.donor_id = 7
    if @donation.save
      redirect_to @donation, notice: "Your donation has been submitted"
    else
      render 'new'
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end


private
  def donations_params
    params.require(:donation).permit(:description, :pic1, :pic2, :pic3)
  end
end
