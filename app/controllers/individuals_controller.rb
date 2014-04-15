class IndividualsController < ApplicationController
  layout 'dashboard', only: [:show]

  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find_by id: params[:id]
    @view = params[:content_view]
    @sale_items = @individual.sale_items
    @donations  = @individual.donations
    @purchases  = @individual.purchases
  end
end
