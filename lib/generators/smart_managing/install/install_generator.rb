class SmartManaging::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc 'Copy initializer files'
  def copy_initializer
    template 'initializer.rb', 'config/initializers/smart_managing.rb'
    template 'simple_form_smart_managing.rb', 'config/initializers/simple_form_smart_managing.rb'
  end
end
