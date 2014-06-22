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
  
end
