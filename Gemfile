source 'https://rubygems.org'

DATA_MAPPER = 'http://github.com/datamapper'
RONIN = 'http://github.com/ronin-ruby'

gem 'contextify',	'~> 0.1.6', :git => 'http://github.com/postmodern/contextify.git'

# DataMapper dependencies
gem 'dm-core',		'~> 1.0.0', :git => "#{DATA_MAPPER}/dm-core.git"
gem 'dm-migrations',	'~> 1.0.0', :git => 'http://github.com/postmodern/dm-migrations.git'

gem 'gscraper',		'~> 0.3.1', :git => 'http://github.com/postmodern/gscraper.git'
gem 'ronin-support',	'~> 0.1.0', :git => "#{RONIN}/ronin-support.git"
gem 'ronin',		'~> 0.4.0', :git => "#{RONIN}/ronin.git"
gem 'ronin-scanners',	'~> 0.2.0', :git => "#{RONIN}/ronin-scanners.git"

group(:development) do
  gem 'bundler',	'~> 1.0.0'
  gem 'rake',		'~> 0.8.7'
  gem 'jeweler',	'~> 1.5.0.pre'
end

group(:doc) do
  case RUBY_PLATFORM
  when 'java'
    gem 'maruku',	'~> 0.6.0'
  else
    gem 'rdiscount',	'~> 1.6.3'
  end

  gem 'dm-visualizer',		'~> 0.1.0'
  gem 'yard',			'~> 0.5.3'
  gem 'yard-contextify',	'~> 0.1.0'
end

gem 'rspec',	'~> 2.0.0.beta.20', :group => [:development, :test]
