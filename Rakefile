# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './tasks/spec.rb'
require './lib/ronin/dorks/version.rb'

Hoe.new('ronin-dorks', Ronin::Dorks::VERSION) do |p|
  p.rubyforge_name = 'ronin'
  p.developer('Postmodern', 'postmodern.mod3@gmail.com')
  p.remote_rdoc_dir = 'docs/ronin-dorks'
  p.extra_deps = [
    ['ronin', '>=0.2.1'],
    ['ronin-web', '>=0.1.1'],
    ['gscraper', '>=0.2.2']
  ]
end

# vim: syntax=Ruby
