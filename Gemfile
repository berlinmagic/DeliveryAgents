source 'https://rubygems.org'

gem 'rails', '4.1.1'


## Database
gem 'sqlite3'



## Assests
gem 'sass-rails',     '~> 4.0.3'
gem 'uglifier',       '>= 1.3.0'
gem 'coffee-rails',   '~> 4.0.0'
# gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
# => gem 'bourbon',        '~> 3.2.1'
# => gem 'bootstrap-sass', '~> 3.1.1'
gem 'magic_stylez'
#gem 'jquery-fileupload-rails'
gem "i18n-js"         # => use locale files and I18n helper in js also


# also generate assets without digest
gem "non-stupid-digest-assets"

gem "active_model_serializers"



## Authentication and Authorisation
gem 'devise'
gem 'devise-i18n-views'
gem "omniauth-paypal"


## JSON API
gem 'rabl'
gem 'oj'


gem 'dragonfly', "~>1.0.4"


group :development do
  gem 'letter_opener'                       # => open emails in a new browser-window
  gem "better_errors"                       # => much better and more useful error page
  gem "binding_of_caller"                   # => makes better_errors even better (variables ...)
  gem 'quiet_assets'                        # => shortened log from asset-pipeline
  gem "annotate"
end


group :assets do
  gem 'therubyracer', :platforms => :ruby
end



# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',   group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# => produces a lot of strange errors, seems like the same power as turbolinks, nobody knows :)
#gem 'spring',             group: :development

# cloudcontrol deploy
