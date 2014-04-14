class InquiriesController < ApplicationController
  def new
    @merchandise = Merchandise.find(params[:merchandise_id])
    @inquiry = @merchandise.inquiries.new
  end

  def create
    @merchandise = Merchandise.find(params[:merchandise_id])
    @inquiry = @merchandise.inquiries.new(inquiry_params)
    @inquiry.individual_id = current_individual.id
    if @inquiry.save
      redirect_to merchandises_path, notice: "Thank you for your inquiry! Your message has been sent to the seller."
      Notifier.contact_seller(@inquiry).deliver
    else
      render "new", notice: "There was an error processing your request."
    end
  end

private

  def inquiry_params
    params.require(:inquiry).permit(:merchandise_id, :comment, :individual_id)
  end
end
