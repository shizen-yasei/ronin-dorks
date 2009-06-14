# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'
require './tasks/spec.rb'
require './lib/ronin/dorks/version.rb'

Hoe.spec('ronin-dorks') do
  self.rubyforge_name = 'ronin'
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')
  self.remote_rdoc_dir = 'docs/ronin-dorks'
  self.extra_deps = [
    ['ronin', '>=0.2.2'],
    ['ronin-web', '>=0.1.2'],
    ['gscraper', '>=0.2.2']
  ]
end

# vim: syntax=Ruby
