# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "fluent-plugin-level-to-keyword"
  gem.description = "SysLog level number to SysLog keyword formatter plugin for Fluent"
  gem.homepage    = "https://github.com/slytherincz/fluent-plugin-level-to-keyword"
  gem.summary     = gem.description
  gem.version     = File.read("VERSION").strip
  gem.authors     = ["SlytherinCz"]
  gem.email       = "slytherincz@gmail.com"
  gem.has_rdoc    = false
  #gem.platform    = Gem::Platform::RUBY
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_dependency "fluentd", "~> 0.10.0"
  gem.add_development_dependency "rake", ">= 0.9.2"
end