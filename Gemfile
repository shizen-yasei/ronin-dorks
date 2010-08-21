source 'https://rubygems.org'

RONIN = 'git://github.com/ronin-ruby'

# DataMapper dependencies
gem 'dm-core',	'~> 1.0.0', :git => 'git://github.com/datamapper/dm-core.git'
gem 'dm-migrations',	'~> 1.0.0', :git => 'git://github.com/postmodern/dm-migrations.git'

gem 'gscraper',	'~> 0.3.0'
gem 'ronin-support',	'~> 0.1.0', :git => "#{RONIN}/ronin-support.git"
gem 'ronin',		'~> 0.4.0', :git => "#{RONIN}/ronin.git"
gem 'ronin-scanners',	'~> 0.2.0', :git => "#{RONIN}/ronin-scanners.git"

group(:development) do
  gem 'bundler',	'~> 1.0.0'
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

gem 'rspec',	'~> 2.0.0.beta.16', :group => [:development, :test]
