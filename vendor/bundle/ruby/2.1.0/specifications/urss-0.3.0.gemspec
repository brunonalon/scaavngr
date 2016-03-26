# -*- encoding: utf-8 -*-
# stub: urss 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "urss".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["zedtux".freeze]
  s.date = "2012-08-21"
  s.description = "Ultra RSS is a Feed RSS parser that support multiple subitems (media:content and media:thumbnail)".freeze
  s.email = ["zedtux@zedroot.org".freeze]
  s.homepage = "https://github.com/zedtux/urss".freeze
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Ultra RSS is a Feed RSS parser.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
  end
end
