class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)

    # if current_individual

      if current_individual.try(:admin?)
        admin_individual_path(current_individual)
      elsif current_individual
        individual_path(current_individual)
      else
        organization_path(current_organizaton)
      end

    # else current_organizaton
    #   organization_path(current_organization)
    # end

  end

protected

  def configure_permitted_parameters
    [:name].each do |field|
      devise_parameter_sanitizer.for(:sign_up) << field
      devise_parameter_sanitizer.for(:account_update) << field
    end
  end
end
