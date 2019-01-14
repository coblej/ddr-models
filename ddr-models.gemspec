$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ddr/models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ddr-models"
  s.version     = Ddr::Models::VERSION
  s.authors     = ["Jim Coble", "David Chandek-Stark"]
  s.email       = ["lib-drs@duke.edu"]
  s.homepage    = "https://github.com/duke-libraries/ddr-models"
  s.summary     = "Models used in the Duke Digital Repository"
  s.description = "Models used in the Duke Digital Repository"
  s.license     = "BSD-3-Clause"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "blacklight"
  s.add_dependency "mime-types"
  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency "rsolr"
  s.add_dependency "valkyrie", "~> 1.4.0"

  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "rspec-its"
  s.add_development_dependency "rspec-rails", "~> 3.8.1"
  s.add_development_dependency "sqlite3"
end
