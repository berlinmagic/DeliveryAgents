module ApplicationHelper
  
  def icon( icn, txt = "" )
    raw("<i class='icon-#{icn}#{" #{txt}" if !txt.blank?}'></i>")
  end

  def glyphicon( icn, txt = "" )
    raw("<i class='glyphicon glyphicon-#{icn}#{" #{txt}" if !txt.blank?}'></i>")
  end

  def log( stuff = "# # # # # # # # # # # # # # #" )
    Rails.logger.info( stuff ) if Rails.env.development?
  end
  
  
  def error_msg( item )
    if item.errors.any?
      cls = item.class.to_s.parameterize("_")
      headline = "Couldn't save #{cls.to_s.titleize}, there are #{item.errors.count} errors!"
      msgs = ""
      item.errors.each do |key, msg|
        if key.to_s.split(".").count > 1
          key = key.to_s.split(".")
          that = "#{key[0].to_s.titleize}: #{key[1].to_s.titleize}"
        else
          that = key.to_s.titleize
        end
        msgs += <<-HTML
                  <li>#{ icon("arrow-right") } <strong>#{ that }</strong> #{ msg }</li>
                HTML
      end
      html = <<-HTML
          <div class="error-box banderole">
            <div class="icn">
              #{ icon("info-round") }
            </div>
            <h4>#{ headline }</h4>
            <ul>
              #{ msgs }
            </ul>
          </div>
      HTML

      html.html_safe
    end
  end
  
  
end
