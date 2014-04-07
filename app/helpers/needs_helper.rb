module NeedsHelper
  def list_needs
      @needs.each do |x|
        concat content_tag :h5, "Organization #{x.organization_id}"
        concat content_tag :p, "#{x.description}"
        concat button_tag "Donate"
    end
    return
  end
end
