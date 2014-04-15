class MerchandisesController < ApplicationController
  before_action :load_merchandise, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_individual!, only: [:new, :create, :update]
  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = Merchandise.new(merchandise_params)
    @merchandise.individual_id = current_individual.id
    if @merchandise.save
      redirect_to @merchandise
    else
      render "new", notice: "There was an error processing your request."
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
    if params[:query].present?
      @merchandises = Merchandise.text_search(params[:query]).page(params[:pages]).per_page(12)
    else
      @merchandises = Merchandise.order(:title).page(params[:page]).per_page(12)
    end
  end

  def contact

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
      :organization_id,
      :individual_id
    )
  end
end
