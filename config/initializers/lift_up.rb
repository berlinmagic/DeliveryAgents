require 'active_record'
require 'active_support/concern'

require "#{Rails.root}/app/models/concerns/has_address"

ActiveRecord::Base.send :include, HasAddress