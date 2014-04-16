module IndividualsHelper

  def dashboard_content(view)
    render partial: view
  end

  def individual_show(individual)
    if individual == current_individual
      render partial: 'dashboard'
    else
      render partial: 'profile'
    end
  end

end
