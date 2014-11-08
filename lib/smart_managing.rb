require 'jquery-rails'
require 'coffee-rails'
require 'bootstrap-sass'
require 'smart_listing'
require 'simple_form'
require 'smart_managing/engine'
require 'smart_managing/controller_helpers'

module SmartManaging
  UNEDITABLE_ATTRIBUTES = ['id', 'created_at', 'updated_at']
end
