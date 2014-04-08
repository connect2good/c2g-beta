module NeedsHelper
  def list_needs
    concat content_tag :h2, "Needs"
      Need.all.each do |x|
        concat content_tag :h4, "#{Organization.find(x.organization_id).name}"
        concat content_tag :p, "#{x.description}"
        concat button_tag "Donate"
    end
    return
  end
end
