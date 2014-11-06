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
  s.summary     = "Easy way to create a managing interface."
  s.description = "Easy way to create a managing interface."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.7"

  s.add_development_dependency "sqlite3"
end
