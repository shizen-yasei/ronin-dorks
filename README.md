# Ronin Dorks

* [ronin.rubyforge.org/docs/ronin-dorks](http://ronin.rubyforge.org/docs/ronin-dorks/)
* [github.com/postmodern/ronin-dorks](http://github.com/postmodern/ronin-dorks)
* [github.com/postmodern/ronin-dorks/issues](http://github.com/postmodern/ronin-dorks/issues)
* [groups.google.com/group/ronin-ruby](http://groups.google.com/group/ronin-ruby)
* irc.freenode.net #ronin

## Description

Ronin Dorks is a Ruby library for Ronin that provides support for various
Google (tm) Dorks functionality.

Ronin is a Ruby platform for exploit development and security research.
Ronin allows for the rapid development and distribution of code, exploits
or payloads over many common Source-Code-Management (SCM) systems.

### Ruby

Ronin's Ruby environment allows security researchers to leverage Ruby with
ease. The Ruby environment contains a multitude of convenience methods
for working with data in Ruby, a Ruby Object Database, a customized Ruby
Console and an extendable command-line interface.

### Extend

Ronin's more specialized features are provided by additional Ronin
libraries, which users can choose to install. These libraries can allow
one to write and run Exploits and Payloads, scan for PHP vulnerabilities,
perform Google Dorks  or run 3rd party scanners.

### Publish

Ronin allows users to publish and share code, exploits, payloads or other
data via Overlays. Overlays are directories of code and data that can be
hosted on any SVN, Hg, Git or Rsync server. Ronin makes it easy to create,
install or update Overlays.

## Features

* Provides convenience methods for many common Google (tm) Dorks:
  * Search for URLs containing a specified string.
  * Search for URLs containing a specified pattern.
  * Search for Pages containing a specified text string.
  * Search for Pages containing a specified text pattern.
  * Search for Indexes of unprotected `cgi-bin` directories.
  * Search for unprotected MySQL dump files.
  * Search for unprotected MySQL dump files containing the password hash
    'admin'.
  * Search for Certificate Practice Statement documents.
  * Search for Network Vulnerability Assessemnt reports.
  * Search for order receipts.
  * Search for `robots.txt` files.
  * Search for unprotected PHP MyAdmin panels.
  * Search for `emails.xls` files.
  * Search for `finances.xls` files.

## Synopsis

Start the Ronin console with Ronin Dorks preloaded:

    $ ronin dorks

## Examples

Search for URLs containing a pattern:

    Web::Dorks.inurl('stmt=')

Search for URLs containing all patterns:

    Web::Dorks.allinurl(['show', 'php', 'page'])

Search for pages containing the specified text in the title:

    Web::Dorks.intitle('Profile')

Search for pages containing all specified text in the title:

    Web::Dorks.allintitle(['Profile', 'Edit'])

Search for pages containing the specified text:

    Web::Dorks.intext('Powered by')

Search for pages containing all specified text:

    Web::Dorks.allintext(['Powered by', '0.5'])

## Requirements

* [ronin](http://ronin.rubyforge.org/) >= 0.3.0
* [gscraper](http://gscraper.rubyforge.org/) >= 0.2.2

## Install

    $ sudo gem install ronin-dorks

## License

Ronin Dorks - A Ruby library for Ronin that provides support for various
Google (tm) Dorks and Hacking functionality.

Copyright (c) 2008-2010 Hal Brodigan (postmodern.mod3 at gmail.com)

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
