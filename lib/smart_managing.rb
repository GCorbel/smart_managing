require 'jquery-rails'
require 'coffee-rails'
require 'bootstrap-sass'
require 'smart_listing'
require 'inherited_resources'
require 'simple_form'
require 'smart_managing/engine'
module SmartManaging
  UNEDITABLE_ATTRIBUTES = ['id', 'created_at', 'updated_at']
end
