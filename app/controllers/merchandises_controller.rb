class MerchandisesController < ApplicationController
  before_action :load_merchandise, only: [:show, :edit, :destroy, :update]

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
    # before_action :load_merchandise
  end

  def edit
    # before_action :load_merchandise
  end

  def update
    # before_action :load_merchandise
    @merchandise.update_attributes(merchandise_params)
    redirect_to merchandises_path
  end

  def destroy
    # before_action :load_merchandise
    @merchandise.destroy
    redirect_to merchandises_path
  end

  def index
    @merchandises = Merchandise.all.page(params[:page]).per_page(12)
  end

private

  def load_merchandise
    @merchandise = Merchandise.find(params[:id])
  end


  def merchandise_params
    params.require(:merchandise).permit(
      :title,
      :description,
      :price,
      :agree,
      :pic1,
      :pic2,
      :pic3,
    )
  end
end
