class DonationsController < ApplicationController
  def index
  end

  def new
    @donation = Donation.new
  end

  def create
  end

  def show
    @donation = Donation.find(params[:id])
  end
end
