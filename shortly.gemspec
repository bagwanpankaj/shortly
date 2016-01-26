# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shortly}
  s.version = File.open("VERSION").read

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bagwan Pankaj"]
  s.date = %q{2016-01-26}
  s.default_executable = %q{shortly}
  s.description = %q{Ruby Wrapper for different Url Shortner Services Ruby Wrapper}
  s.email = %q{bagwanpankaj@gmail.com}
  s.executables = ["shortly"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    "LICENSE.txt",
    "VERSION",
    "bin/shortly",
    "lib/shortly.rb",
    "lib/shortly/client.rb",
    "lib/shortly/clients/bitly.rb",
    "lib/shortly/clients/googl.rb",
    "lib/shortly/clients/isgd.rb",
    "lib/shortly/clients/jmp.rb",
    "lib/shortly/clients/shortswitch.rb",
    "lib/shortly/clients/snim.rb",
    "lib/shortly/clients/tinyurl.rb",
    "lib/shortly/clients/vgd.rb",
    "lib/shortly/clients/bitdo.rb",
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
    "spec/spec_helper.rb",
    "spec/support/fakeweb_stub.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["= 0.13.0"])
      s.add_runtime_dependency(%q<json>, ["= 1.8.1"])
    else
      s.add_dependency(%q<httparty>, ["= 0.13.0"])
      s.add_dependency(%q<json>, ["= 1.8.1"])
    end
  else
    s.add_dependency(%q<httparty>, ["= 0.13.0"])
    s.add_dependency(%q<json>, ["= 1.8.1"])
  end
end

