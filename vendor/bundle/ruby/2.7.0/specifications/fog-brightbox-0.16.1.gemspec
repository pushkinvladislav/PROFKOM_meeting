# -*- encoding: utf-8 -*-
# stub: fog-brightbox 0.16.1 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-brightbox".freeze
  s.version = "0.16.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paul Thornthwaite".freeze]
  s.date = "2018-09-07"
  s.description = "Module for the 'fog' gem to support Brightbox Cloud".freeze
  s.email = ["tokengeek@gmail.com".freeze]
  s.homepage = "https://github.com/fog/fog-brightbox".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.9".freeze
  s.summary = "This library can be used as a module for `fog` or as standalone provider to use the Brightbox Cloud in applications".freeze

  s.installed_by_version = "3.2.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<fog-core>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<fog-json>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<dry-inflector>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<shindo>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  else
    s.add_dependency(%q<fog-core>.freeze, [">= 0"])
    s.add_dependency(%q<fog-json>.freeze, [">= 0"])
    s.add_dependency(%q<dry-inflector>.freeze, [">= 0"])
    s.add_dependency(%q<mime-types>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<shindo>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
  end
end
