= Ronin Dorks

* http://ronin.rubyforge.org/dorks/
* Postmodern Modulus III

== DESCRIPTION:

Ronin Dorks is a Ruby library for Ronin that provides support for various
Google (tm) Dorks functionality.

Ronin is a Ruby platform designed for information security and data
exploration tasks. Ronin allows for the rapid development and distribution
of code over many of the common Source-Code-Management (SCM) systems.

=== Free

All source code within Ronin is licensed under the GPL-2, therefore no user
will ever have to pay for Ronin or updates to Ronin. Not only is the
source code free, the Ronin project will not sell enterprise grade security
snake-oil solutions, give private training classes or later turn Ronin into
commercial software.

=== Modular

Ronin was not designed as one monolithic library but instead as a collection
of libraries which can be individually installed. This allows users to pick
and choose what functionality they want in Ronin.

=== Decentralized

Ronin does not have a central repository of exploits and payloads which
all developers contribute to. Instead Ronin has Overlays, repositories of
code that can be hosted on any CVS/SVN/Git/Rsync server. Users can then use
Ronin to quickly install or update Overlays. This allows developers and
users to form their own communities, independent of the main developers
of Ronin.

== FEATURES/PROBLEMS:

* Provides convenience methods for many common Google (tm) Dorks:
  * Search for URLs containing a specified string:
  * Search for URLs containing a specified pattern:
  * Search for Indexes of unprotected <tt>cgi-bin</tt> directories.
  * Search for unprotected MySQL dump files.
  * Search for unprotected MySQL dump files containing the password hash
    'admin'.
  * Search for Certificate Practice Statement documents.
  * Search for Network Vulnerability Assessemnt reports.
  * Search for order receipts.
  * Search for <tt>robots.txt</tt> files.
  * Search for unprotected PHP MyAdmin panels.
  * Search for <tt>emails.xls</tt> files.
  * Search for <tt>finances.xls</tt> files.

== SYNOPSIS:

  $ ronin dorks

== REQUIREMENTS:

* Ronin >= 0.0.9
* GScraper >= 0.2.0

== INSTALL:

  $ sudo gem install ronin-dorks

== LICENSE:

Ronin SQL - A Ruby library for Ronin that provides support for various
Google (tm) Dorks and Hacking functionality.

Copyright (c) 2008 Hal Brodigan (postmodern.mod3 at gmail.com)

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
