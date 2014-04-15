class IndividualsController < ApplicationController
  layout 'dashboard', only: [:show]

  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find_by id: params[:id]
  end
end
