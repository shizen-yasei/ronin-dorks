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

require 'ronin/scanners/url_scanner'
require 'ronin/network/http'

module Ronin
  module Dorks
    class Dork < Scanners::URLScanner

      contextify :ronin_dork

      parameter :pause, :default => 1.0,
                        :description => 'Seconds to pause between pages'

      #
      # Default method which creates a query object.
      #
      # @return [Array]
      #   Returns an empty Array by default.
      #
      # @since 0.2.0
      #
      def dork
        []
      end

      protected

      #
      # Enumerates over every page of results from the query.
      #
      # @param [#each] query
      #   The query object.
      #
      # @yield [page]
      #   The given block will be passed every page.
      #
      # @yieldparam [#each] page
      #   A page of results from the query.
      #
      # @since 0.2.0
      #
      def each_page(query,&block)
        query.each(&block)
      end

      #
      # Enumerates over every URL within a page.
      #
      # @param [#each] page
      #   The page of URLs.
      #
      # @yield [url]
      #   The given block will be pass every URL.
      #
      # @yieldparam [URI::HTTP, URI::HTTPS, String] url
      #   A URL from the page.
      #
      # @since 0.2.0
      #
      def each_url(page,&block)
        page.each(&block)
      end

      #
      # Performs a query and enumerates over every URL.
      #
      # @yield [url]
      #   The given block will be passed every URL found by the query.
      #
      # @yieldparam [URI::HTTP, URI::HTTPS, String] url
      #   A URL from the query.
      #
      # @see #dork
      # @see #each_page
      # @see #each_url
      #
      # @since 0.2.0
      #
      def scan(&block)
        query = dork()

        each_page(query) do |page|
          sleep(self.pause) if (self.pause && self.pause > 0)

          each_url(page,&block)
        end
      end

    end
  end
end
