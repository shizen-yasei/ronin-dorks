# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'hoe/signing'

Hoe.plugin :yard

Hoe.spec('ronin-dorks') do
  self.rubyforge_name = 'ronin'
  self.developer('Postmodern', 'postmodern.mod3@gmail.com')

  self.rspec_options += ['--colour', '--format', 'specdoc']

  self.yard_options += ['--protected']
  self.remote_rdoc_dir = 'docs/ronin-dorks'

  self.extra_deps = [
    ['ronin', '>=0.3.0'],
    ['gscraper', '>=0.2.2']
  ]

  self.extra_dev_deps = [
    ['rspec', '>=1.3.0'],
    ['yard', '>=0.5.3']
  ]
end

# vim: syntax=Ruby
