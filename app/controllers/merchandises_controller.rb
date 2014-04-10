class MerchandisesController < ApplicationController
  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = Merchandise.new(merchandise_params)
    if @merchandise.save
      redirect_to @merchandise
    else
      render "new"
    end
  end

  def show
    @merchandise = Merchandise.find(params[:id])
  end

  def edit
    @merchandise = Merchandise.find(params[:id])
  end

  def destroy
    @merchandise = Merchandise.find(params[:id])
    @merchandise.destroy
    redirect_to merchandises_path
  end

  def index
    @merchandises = Merchandise.all
  end

private
  def merchandise_params
    params.require(:merchandise).permit(:title, :description, :price, :agree, :pic1, :pic2, :pic3)
  end
end
