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

require 'ronin/dorks/dork'

require 'gscraper/search'

module Ronin
  module Dorks
    class GoogleDork < Dork

      contextify :ronin_google_dork

      parameter :user_agent, :default => Network::HTTP.user_agent,
                             :description => 'The UserAgent to send'

      parameter :proxy, :default => Network::HTTP.proxy,
                        :description => 'The proxy to use'

      #
      # Creates a new google dork query.
      #
      # @param [Hash] options
      #   Additional options.
      #
      # @yield [query]
      #   If a block is given, it will be passed the new google dork query.
      #
      # @yieldparam [GScraper::Search::WebQuery] query
      #   The google dork query.
      #
      # @see http://gscraper.rubyforge.org/classes/GScraper/Search/WebQuery.html#M000053
      #
      # @since 0.2.0
      #
      def web_query(options={},&block)
        GScraper::Search::WebQuery.new(default_options(options),&block)
      end

      alias query web_query

      #
      # Creates a new google dork query.
      #
      # @param [Hash] options
      #   Additional options.
      #
      # @yield [query]
      #   If a block is given, it will be passed the new google dork query.
      #
      # @yieldparam [GScraper::Search::AJAXQuery] query
      #   The google dork query.
      #
      # @see http://gscraper.rubyforge.org/classes/GScraper/Search/AJAXQuery.html#M000018
      #
      # @since 0.2.0
      #
      def ajax_query(options={},&block)
        GScraper::Search::AJAXQuery.new(default_options(options),&block)
      end

      protected

      #
      # Overrides the given options with various default options.
      #
      # @param [Hash] options
      #   The options to add default values to.
      #
      # @since 0.2.0
      #
      def default_options(options={})
        options.merge(
          :user_agent => self.user_agent,
          :proxy => self.proxy
        )
      end

      #
      # Normalizes a given result from a query.
      #
      # @param [GScraper::Search::Result] result
      #   The result to normalize.
      #
      # @return [URI::HTTP, URI::HTTPS]
      #   The normalized result.
      #
      # @since 0.2.0
      #
      def normalize_result(result)
        result.url
      end

    end
  end
end
