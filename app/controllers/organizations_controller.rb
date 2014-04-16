class OrganizationsController < ApplicationController
  layout :determine_layout

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.find_by id: params[:id]

    # TODO: determine if there's a better way
    @view = @_env['PATH_INFO'].split(/\//)[-1]
    @view = 'needs' if @view =~ /\d+/

    case @view
      when 'needs'
        @needs = @organization.needs
      when 'benefits'
        @benefits = @organization.benefits
      else
        # default   
      end
  end

private

  def determine_layout

    if @organization == current_organization
      'dashboard'
    else
      'application'
    end


  end

end
