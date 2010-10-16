# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ronin-dorks}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Postmodern"]
  s.date = %q{2010-10-16}
  s.description = %q{Ronin Dorks is a Ruby library for Ronin that provides support for various Google (tm) Dorks functionality.}
  s.email = %q{ronin-ruby@googlegroups.com}
  s.executables = ["ronin-dork", "ronin-dorks"]
  s.extra_rdoc_files = [
    "ChangeLog.md",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".yardopts",
    "COPYING.txt",
    "ChangeLog.md",
    "Gemfile",
    "Gemfile.lock",
    "Manifest.txt",
    "README.md",
    "Rakefile",
    "bin/ronin-dork",
    "bin/ronin-dorks",
    "lib/ronin/dorks.rb",
    "lib/ronin/dorks/dork.rb",
    "lib/ronin/dorks/google_dork.rb",
    "lib/ronin/dorks/version.rb",
    "lib/ronin/ui/command_line/commands/dork.rb",
    "lib/ronin/web/dorks.rb",
    "lib/ronin/web/dorks/documents.rb",
    "lib/ronin/web/dorks/dorks.rb",
    "lib/ronin/web/dorks/index.rb",
    "ronin-dorks.gemspec",
    "spec/dorks/dork_spec.rb",
    "spec/dorks/dorks_spec.rb",
    "spec/helpers/database.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = %q{yard}
  s.homepage = %q{http://github.com/ronin-ruby/ronin-dorks}
  s.licenses = [["GPL-2"]]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A Ruby library for Ronin that provides support for various Google (tm) Dorks functionality.}
  s.test_files = [
    "spec/dorks/dork_spec.rb",
    "spec/dorks/dorks_spec.rb",
    "spec/helpers/database.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gscraper>, ["~> 0.3.1"])
      s.add_runtime_dependency(%q<ronin>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<ronin-scanners>, ["~> 0.2.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.0.rc"])
    else
      s.add_dependency(%q<gscraper>, ["~> 0.3.1"])
      s.add_dependency(%q<ronin>, ["~> 0.4.0"])
      s.add_dependency(%q<ronin-scanners>, ["~> 0.2.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0.rc"])
    end
  else
    s.add_dependency(%q<gscraper>, ["~> 0.3.1"])
    s.add_dependency(%q<ronin>, ["~> 0.4.0"])
    s.add_dependency(%q<ronin-scanners>, ["~> 0.2.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.0.pre"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0.rc"])
  end
end

