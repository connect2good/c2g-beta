module OrganizationsHelper
    def dashboard_content(view)
    render partial: view
  end

  def organization_show(organization)
    if organization == current_organization
      render partial: 'dashboard'
    else
      render partial: 'profile'
    end
  end
end
