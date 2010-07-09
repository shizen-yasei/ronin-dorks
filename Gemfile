source 'https://rubygems.org'

RONIN = 'git://github.com/ronin-ruby'

group(:runtime) do
  gem 'gscraper',	'~> 0.3.0'
  gem 'ronin-support',	'~> 0.1.0', :git => "#{RONIN}/ronin-support.git"
  gem 'ronin',		'~> 0.4.0', :git => "#{RONIN}/ronin.git"
  gem 'ronin-scanners',	'~> 0.2.0', :git => "#{RONIN}/ronin-scanners.git"
end

group(:development) do
  gem 'bundler',	'~> 0.9.19'
  gem 'rake',		'~> 0.8.7'
  gem 'jeweler',	'~> 1.4.0', :git => 'git://github.com/technicalpickles/jeweler.git'
end

group(:doc) do
  case RUBY_PLATFORM
  when 'java'
    gem 'maruku',	'~> 0.6.0'
  else
    gem 'rdiscount',	'~> 1.6.3'
  end

  gem 'dm-visualizer',	'~> 0.1.0'
  gem 'yard',		'~> 0.5.3'
end

gem 'rspec',	'~> 1.3.0', :group => [:development, :test]
