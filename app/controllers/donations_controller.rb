class DonationsController < ApplicationController
  before_action :authenticate_individual!
  def index
    @donations = Donation.all
  end

  def new
    @need = Need.find(params[:need_id])
    @need_name = @need_name = @need.organization.name
    @donation = @need.donations.new

  end

  def create
    @need = Need.find(params[:need_id])
    @donation = @need.donations.new(donations_params)
    @donation.status = "pending"
    @donation.donor_id = current_individual.id
    if @donation.save
      redirect_to @donation, notice: "Your donation has been submitted"
      Notifier.offer_sent(@donation).deliver
      Notifier.offer_received(@donation).deliver
    else
      render 'new'
    end
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    redirect_to needs_path
  end


private
  def donations_params
    params.require(:donation).permit(:description, :pic1, :pic2, :pic3)
  end
end
