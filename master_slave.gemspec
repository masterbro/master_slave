# -*- encoding: utf-8 -*-
# stub: master_slave 4.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "master_slave".freeze
  s.version = "4.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tumayun".freeze]
  s.date = "2017-03-14"
  s.description = "Rails separate read and write.".freeze
  s.email = "tumayun.2010@gmail.com".freeze
  s.files = ["lib/master_slave.rb".freeze, "lib/master_slave/configuration.rb".freeze, "lib/master_slave/connection_handler.rb".freeze, "lib/master_slave/core.rb".freeze, "lib/master_slave/railtie.rb".freeze, "lib/master_slave/runtime_registry.rb".freeze, "lib/master_slave/version.rb".freeze, "lib/rails/generators/config_generator.rb".freeze, "lib/rails/generators/templates/shards.yml".freeze]
  s.homepage = "https://github.com/tumayun/master_slave".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.6.10".freeze
  s.summary = "master_slave.".freeze
end
