$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smart_managing/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smart_managing"
  s.version     = SmartManaging::VERSION
  s.authors     = ["Guirec Corbel"]
  s.email       = ["guirec.corbel@gmail.com"]
  s.homepage    = "https://github.com/GCorbel/smart_managing"
  s.description = "Easy way to create a managing interface."
  s.summary     = "Easy way to create a managing interface."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'rails', '>= 3.0'
  s.add_dependency 'smart_listing', '>= 1.0.0'
  s.add_dependency 'jquery-rails', '~> 3.0'
  s.add_dependency 'coffee-rails', '>= 3.0'
  s.add_dependency 'bootstrap-sass', '~> 3.0'
  s.add_dependency 'simple_form', '>= 2.0'

  s.add_development_dependency 'sqlite3', '~> 1.0'
  s.add_development_dependency 'rspec-rails', '~> 3.0'

  s.add_development_dependency 'capybara', '~> 2.0'
  s.add_development_dependency 'capybara-webkit', '~> 1.0'
  s.add_development_dependency 'database_cleaner', '~> 1.0'
end
