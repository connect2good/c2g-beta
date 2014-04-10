class NeedsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def index
    @need = Need.all
  end
end
