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

  def destroy
  end

  def index
    @needs = Need.all
  end

private
  def needs_params
    params.require(:need).permit(:title, :description)
  end
end
