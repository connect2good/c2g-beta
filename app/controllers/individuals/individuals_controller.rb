class Individuals::SessionsController < Devise::SessionsController


  def after_sign_in_path_for(resource)

    if current_individual.try(:admin?)
      admin_individual_path(current_individual)
    else
      individual_path(current_individual)
    end

  end

end