$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_events/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "farm_events"
  s.version     = FarmEvents::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jessethebuilder@yahoo.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FarmEvents."
  s.description = "TODO: Description of FarmEvents."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  
  s.test_files = Dir["spec/**/*"]
end
