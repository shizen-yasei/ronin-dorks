#
# Ronin Dorks - A Ruby library for Ronin that provides support for various
# Google (tm) Dorks functionality.
#
# Copyright (c) 2008-2009 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'ronin/ui/command_line/scanner_command'

module Ronin
  module UI
    module CommandLine
      module Commands
        class Dork < ScannerCommand

          desc 'Loads and runs a dork'

          # dork options
          class_option :name, :type => :string, :aliases => '-n'
          class_option :version, :type => :string, :aliases => '-V'
          class_option :describing, :type => :string, :aliases => '-d'
          class_option :license, :type => :string, :aliases => '-l'
          class_option :params, :type => :hash,
                                :default => {},
                                :banner => 'NAME:VALUE ...',
                                :aliases => '-p'
          class_option :file, :type => :string, :aliases => '-f'

          def execute
            Database.setup

            # Load the dork
            if options[:file]
              load_dork!
            else
              find_dork!
            end

            unless @scanner
              print_error "Could not find the specified dork"
              exit -1
            end

            @scanner.params = options[:params]

            scan!
          end

        end
      end
    end
  end
end
