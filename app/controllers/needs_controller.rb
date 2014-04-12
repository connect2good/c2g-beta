class NeedsController < ApplicationController
  def new
    @need = Need.new
  end

  def create
    @need = Need.new(needs_params)
    if @need.save
      redirect_to @need
    else
      render "new"
    end
  end

  def show
    @need = Need.find(params[:id])
  end

  def edit
    @need = Need.find(params[:id])
  end

  def update
    @need = Need.find(params[:id])
    @need.update_attributes(needs_params)
    redirect_to needs_path
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy
    redirect_to needs_path
  end

  def index
    @needs = Need.order(:organization_id).page(params[:pages]).per_page(12)
  end

private
  def needs_params
    params.require(:need).permit(:title, :description)
  end
end
