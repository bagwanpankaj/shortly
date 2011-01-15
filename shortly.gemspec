# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shortly}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bagwan Pankaj"]
  s.date = %q{2011-01-16}
  s.description = %q{Ruby Wrapper for different Url Shortner Services Ruby Wrapper}
  s.email = %q{bagwanpankaj@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.textile"
  ]
  s.files = [
    "lib/shortly.rb",
    "lib/shortly/client.rb",
    "lib/shortly/clients/bitly.rb",
    "lib/shortly/clients/googl.rb",
    "lib/shortly/clients/isgd.rb",
    "lib/shortly/clients/rubyurl.rb",
    "lib/shortly/errors.rb",
    "lib/shortly/helper.rb"
  ]
  s.homepage = %q{http://github.com/bagwanpankaj/shortly}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Url Shortner Services Ruby Wrapper}
  s.test_files = [
    "spec/shortly_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

