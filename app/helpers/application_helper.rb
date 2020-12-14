module ApplicationHelper

  def flash_message(obj = nil, msg = [])
    titulo = css = nil
    %i[notice alert error information].each do |flash_type|
      flash[flash_type] = params[flash_type] if params[flash_type].present?
      next unless flash[flash_type].present?

      titulo, css = flash_message_style(flash_type)
      msg = flash[flash_type].split('<br/>')
      flash[flash_type] = nil
    end
    if obj && !obj.errors.full_messages.blank?
      titulo, css = flash_message_style(:error)
      obj.errors.full_messages.uniq.each do |erro|
        msg << erro.to_s.gsub('base', '')
      end
    end
    render_haml <<-HAML, msg: msg, titulo: titulo, css: css
      - msg.each do |texto|
        .div-flash
          %div{class: css}
            %span
              = titulo
              = texto
    HAML
  end

  def flash_message_style(flash_type)
    flash_data = { success:      ['Informação: ', 'alert alert-success'],
                   alert:        ['Atenção: ',    'alert alert-warning'],
                   warning:      ['Atenção: ',    'alert alert-warning'],
                   error:        ['Erros: ',      'alert alert-danger'],
                   information:  ['Nota: ',       'alert alert-info'],
                   notice:       ['Informação: ', 'alert alert-success'] }
    if flash_data[flash_type].present?
      flash_data[flash_type]
    else
      ['Nota: ', 'alert alert-default']
    end
  end

  def label_class(size)
    "col-sm-#{size} col-form-label text-right"
  end

  def btn_class(options = [:default], rounded: true)
    btn  = 'btn mr-0'
    btn += ' rounded-pill' if rounded
    options = [options] unless options.is_a?(Array)
    btn += options.map { |option| " btn-#{option.to_s}" }.join('')
    btn
  end

  def render_haml(haml, locals = {})
    Haml::Engine.new(haml.strip_heredoc, format: :html5).render(self, locals)
  end
end
