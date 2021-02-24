# -*- encoding: utf-8 -*-
# stub: rbvmomi 2.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rbvmomi".freeze
  s.version = "2.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rich Lane".freeze, "Christian Dickmann".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-04-13"
  s.email = "jrg@vmware.com".freeze
  s.executables = ["rbvmomish".freeze]
  s.files = ["exe/rbvmomish".freeze]
  s.homepage = "https://github.com/vmware/rbvmomi".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "3.2.9".freeze
  s.summary = "Ruby interface to the VMware vSphere API".freeze

  s.installed_by_version = "3.2.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<builder>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<json>.freeze, [">= 1.8"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.5"])
    s.add_runtime_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.5"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.12.0"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.5"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 2.5"])
  else
    s.add_dependency(%q<builder>.freeze, ["~> 3.0"])
    s.add_dependency(%q<json>.freeze, [">= 1.8"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.5"])
    s.add_dependency(%q<optimist>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.5"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.12.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9.5"])
    s.add_dependency(%q<test-unit>.freeze, [">= 2.5"])
  end
end
