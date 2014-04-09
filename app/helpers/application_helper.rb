module ApplicationHelper

  def l( name='', opts={}, &block )
    if block_given?
      content = capture_haml { yield }
    else
      content = nil
    end

    render partial: 'layouts/partials/layout',
      locals: {
        _opts:    normalize_opts(name, opts),
        _content: content
      }
  end

  alias_method :m, :l

  def link_btn( url='#', opts={}, &block )
    partial 'partials/link_btn',
      locals: {
        _url:     url,
        _opts:    normalize_opts('btn link-btn', opts),
        _content: capture_haml { yield }
      }    
  end

  def row( name='', opts={}, &block )
    if block_given?
      content = capture_haml { yield }
    else
      content = nil
    end

    render partial: 'layouts/partials/row',
      locals: {
        _opts:    normalize_opts(name, opts),
        _content: content
      }
  end

  def normalize_opts( name='', opts={} )
    normalized_class =  name.to_s.gsub(/_/,'-') + ' '
    normalized_class << opts[:class].to_s
    opts[:class] = normalized_class.strip
    opts
  end

end
