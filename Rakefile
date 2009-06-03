# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './tasks/spec.rb'
require './lib/ronin/dorks/version.rb'

Hoe.spec('ronin-dorks') do |p|
  p.rubyforge_name = 'ronin'
  p.developer('Postmodern', 'postmodern.mod3@gmail.com')
  p.remote_rdoc_dir = 'docs/ronin-dorks'
  p.extra_deps = [
    ['ronin', '>=0.2.2'],
    ['ronin-web', '>=0.1.2'],
    ['gscraper', '>=0.2.2']
  ]
end

# vim: syntax=Ruby
