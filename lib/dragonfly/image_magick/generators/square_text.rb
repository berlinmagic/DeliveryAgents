# encoding: utf-8
# Initials TextGenerator for dragonfly by twetzel
# Generates an Images for 
# 
# Usage:
#   app = Dragonfly.app
#   app.generate(:square_text, "AB" )
#   app.generate(:square_text, "CD", "background" => "#a0c775" )
#   app.generate(:square_text, "FG", "background" => "#a0c775", "font_family" => "Courier" )
#   ...


require 'dragonfly/hash_with_css_style_keys'

module Dragonfly
  module ImageMagick
    module Generators
      class SquareText

        FONT_STYLES = Dragonfly::ImageMagick::Generators::Text::FONT_STYLES
        FONT_STRETCHES = Dragonfly::ImageMagick::Generators::Text::FONT_STRETCHES
        FONT_WEIGHTS = Dragonfly::ImageMagick::Generators::Text::FONT_WEIGHTS

        def update_url(url_attributes, string, opts={})
          url_attributes.name = "text.#{extract_format(opts)}"
        end

        def call(content, string, opts={})
          opts            = HashWithCssStyleKeys[opts]
          args            = []
          format          = extract_format(opts)
          escaped_string  = "\"#{string.gsub(/"/, '\"')}\""
          # set font:
          font_family     = opts['font_family'] || 'Helvetica'
          font_weight     = FONT_WEIGHTS[opts['font_weight']] || 700
          # set colors:
          background      = opts['background'] || random_color
          font_color      = opts['color'] || get_font_color(background)
          # set sizes:
          size            = ( opts['width'] || 600 ).to_i
          font_size       = ( opts['font_size'] || generate_font_size(size, string) ).to_i
          
          # push Settings
          args.push("-gravity Center")
          args.push("-antialias")
          args.push("-pointsize #{font_size}")
          args.push("-family '#{font_family}'")
          args.push("-fill '#{font_color}'")
          args.push("-stroke #{opts['stroke_color']}") if opts['stroke_color']
          args.push("-style #{FONT_STYLES[opts['font_style']]}") if opts['font_style']
          args.push("-stretch #{FONT_STRETCHES[opts['font_stretch']]}") if opts['font_stretch']
          args.push("-weight #{font_weight}")
          args.push("-background #{background}")
          args.push("label:#{escaped_string}")
          
          content.generate!(:convert, args.join(' '), format)
          
          # dimensions = content.analyse(:image_properties)
          # text_width  = dimensions['width']
          # text_height = dimensions['height']
          
          # Rails.logger.info "ARGS: #{args.to_yaml}"
          args = args.slice(0, args.length - 2)
          # Rails.logger.info "ARGS: #{args.to_yaml}"
          
          args.push("-size #{size}x#{size}")
          args.push("xc:#{background}")
          
          # push a little down, so capital text apears more centered
          args.push("-annotate 0x0+0+#{ (font_size / 9).to_i } #{escaped_string}")
          
          content.generate!(:convert, args.join(' '), format)
          content.add_meta('format' => format, 'name' => "initials.#{format}")
        end

        private
          
          def extract_format(opts)
            opts['format'] || 'png'
          end
          
          def generate_font_size(size, string)
            # generate font size, max half of size
            sz = string.length > 1 ? (size / string.length).to_i : (size / 2).to_i
            (sz * 0.8).to_i
          end
          
          def get_font_color(background)
            # get a readable font-color
            if compare_colors( background, "#000" ).to_f > 0.5
              "#000"
            else
              "#fff"
            end
          end
          
          def random_color
            # get random hex color ( #cs3213 / #c83 )
            # => "##{ 3.times.map{ rand(16).to_s(16) }.join }"
            "##{ 3.times.map{ rand(256).to_s(16).rjust(2,"0") }.join }"
          end
          
          def compare_colors(bg = "#fff", fg = "#000")
            # capture comand (stdout, stderror, status)
            o, e, s = Open3.capture3("compare -metric RMSE xc:'#{bg}' xc:'#{fg}' null:")
            if Rails.env.development?
              Rails.logger.info "***************************************"
              Rails.logger.info "***************************************"
              Rails.logger.info "$ compare -metric RMSE xc:'#{bg}' xc:'#{fg}' null:"
              Rails.logger.info "stdout: #{o}"
              Rails.logger.info "stderr: #{e}"
              Rails.logger.info "status: #{s}"
              Rails.logger.info "***************************************"
            end
            # output comes via standard error 
            # fetch percentage from output e.g. "48520.2 (0.74037)" => 0.74037 %
            e = e.match(/.*\((.*)\).*/)[1] if e.match(/.*\((.*)\).*/)
            return e
          end

      end

    end
  end
end
