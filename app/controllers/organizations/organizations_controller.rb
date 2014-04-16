class Organizations::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)

    if current_organizaton
      organization_path(current_organization)
    end

  end
end