require 'dragonfly'
require "#{Rails.root}/lib/dragonfly/image_magick/generators/square_text"

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  allow_fetch_url = true
  allow_fetch_file = true

  protect_from_dos_attacks true
  secret "ef1e7007d3d5684e60df4941f838d3f0f18be603a5863f37dd1f4a5493c90b40"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end


# Dragonfly[:images].processor.register(SquareText)
#
# # optional, but gives you the ability to use watermark(opacity: 50)
# # rather than process(:watermark, opacity: 50)
# Dragonfly[:images].configure do |c|
#   c.job(:square_text) { |*args| process(:square_text, *args) }
# end

Dragonfly.app.add_generator :square_text, Dragonfly::ImageMagick::Generators::SquareText.new


