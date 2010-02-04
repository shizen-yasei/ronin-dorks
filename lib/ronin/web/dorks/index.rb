#
# Ronin Dorks - A Ruby library for Ronin that provides support for various
# Google (tm) Dorks functionality.
#
# Copyright (c) 2008-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'ronin/web/dorks/dorks'

module Ronin
  module Web
    module Dorks
      def Dorks.index_of(path=nil,options={},&block)
        if path
          options = options.merge(:intitle => "\"Index of #{path}\"")
        else
          options = options.merge(:intitle => '"Index of"')
        end

        return Dorks.search(options,&block)
      end

      def Dorks.index_of_cgi_bin(options={},&block)
        Dorks.index_of('/cgi-bin',&block)
      end

      def Dorks.index_with_file(name,options={},&block)
        Dorks.index_of(options.merge(:intext => "\"#{name}\""),&block)
      end

      def Dorks.index_with_sql(options={},&block)
        Dorks.index_of(options.merge(:intext => '".sql"'),&block)
      end

      def Dorks.index_for_finances_xls(options={},&block)
        Dorks.search(options.merge(
          :query => 'finances.xls',
          :intitle => '"Index of"'
        ),&block)
      end
    end
  end
end
