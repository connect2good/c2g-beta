class IndividualsController < ApplicationController
  layout :determine_layout

  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find_by id: params[:id]

    # TODO: determine if there's a better way
    @view = @_env['PATH_INFO'].split(/\//)[-1]
    @view = 'sale_items' if @view =~ /\d+/

    case @view
      when 'sale_items'
        @sale_items = @individual.sale_items
      when 'donations'
        @donations  = @individual.donations
      when 'purchases'
        @purchases  = @individual.purchases
      else
        # default   
      end
  end

private

  def determine_layout

    if @individual == current_individual
      'dashboard'
    else
      'application'
    end


  end

end
