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

require 'gscraper/search'
require 'digest/md5'

module Ronin
  module Web
    module Dorks
      include GScraper

      #
      # Creates either a `GScraper::Search::WebQuery` or a
      # `GScraper::Search::AJAXQuery` object.
      # If a _block_ is given, it will be passed the newly created 
      # query object.
      #
      # @param [Hash] options
      #   Additional options.
      #
      # @option options [Boolean] :ajax
      #   Specifies wether or not to create a
      #   `GScraper::Search::AJAXQuery`.
      #
      # @yield [query]
      #   If a block is given, it will be passed the newly created query
      #   object.
      #
      # @yieldparam [GScraper::Search::WebQuery, GScraper::Search::AJAXQuery] query
      #   The newly created query object.
      #
      # @return [GScraper::Search::WebQuery, GScraper::Search::AJAXQuery]
      #   The query object.
      #
      # @see http://gscraper.rubyforge.org/classes/GScraper/Search/WebQuery.html
      # @see http://gscraper.rubyforge.org/classes/GScraper/Search/AJAXQuery.html
      #
      def Dorks.search(options={},&block)
        if options[:ajax] == true
          return Search.ajax_query(options,&block)
        else
          return Search.query(options,&block)
        end
      end

      def Dorks.intext(pattern,options={},&block)
        Dorks.search(options.merge(:intext => pattern),&block)
      end

      def Dorks.allintext(pattern,options={},&block)
        Dorks.search(options.merge(:allintext => pattern),&block)
      end

      def Dorks.string_intext(string,options={},&block)
        Dorks.intext("'#{string}'",options,&block)
      end

      def Dorks.all_strings_intext(strings,options={},&block)
        Dorks.search(options.merge(:allintext => strings.map { |string|
          "'#{string}'"
        }),&block)
      end

      def Dorks.intitle(pattern,options={},&block)
        Dorks.search(options.merge(:intitle => pattern),&block)
      end

      def Dorks.string_intitle(string,options={},&block)
        Dorks.intitle("'#{string}'",options,&block)
      end

      def Dorks.allintitle(patterns,options={},&block)
        Dorks.search(options.merge(:allintitle => patterns),&block)
      end

      def Dorks.all_strings_intitle(strings,options={},&block)
        Dorks.search(options.merge(:allintitle => strings.map { |string|
          "'#{string}'"
        }),&block)
      end

      def Dorks.inurl(pattern,options={},&block)
        Dorks.search(options.merge(:inurl => pattern),&block)
      end

      def Dorks.string_inurl(string,options={},&block)
        Dorks.inurl("'#{string}'",options,&block)
      end

      def Dorks.allinurl(patterns,options={},&block)
        Dorks.search(options.merge(:allinurl => patterns),&block)
      end

      def Dorks.all_strings_inurl(strings,options={},&block)
        Dorks.search(options.merge(:allinurl => strings.map { |string|
          "'#{string}'"
        }),&block)
      end

      def Dorks.sql_dump(options={},&block)
        query = []
        
        query << "Host: #{options[:host]}" if options[:host]
        query << "Database: #{options[:database]}" if options[:database]
        query << options[:version] if options[:version]

        query << "\"#{options[:sql]}\"" if options[:sql]

        if options[:password]
          query << Digest::MD5.hexdigest(options[:password].to_s)
        end

        return Dorks.search(options.merge(
          :query => query,
          :exact_phrase => '"SQL Dump"',
          :filetype => :sql
        ),&block)
      end

      def Dorks.sql_admin_dump(options={},&block)
        Dorks.sql_dump(options.merge(:password => 'admin'),&block)
      end

      def Dorks.robots_txt(options={},&block)
        Dorks.search(options.merge(
          :exact_phrase => 'robots.txt',
          :with_words => ['Disallow'],
          :filetype => :txt
        ),&block)
      end

      def Dorks.php_my_admin(options={},&block)
        Dorks.search(options.merge(
          :with_words => ['phpMyAdmin'],
          :exact_phrase => 'running on',
          :inurl => 'main.php'
        ),&block)
      end

      def Dorks.download_file(options={},&block)
        Dorks.search(options.merge(
          :allinurl => ['download.php?', 'file']
        ),&block)
      end

      def Dorks.download_pdf(options={},&block)
        Dorks.search(options.merge(
          :allinurl => [
            'download.php?',
            'file',
            '.pdf'
          ]
        ),&block)
      end

      def Dorks.sharepoint(options={},&block)
        Dorks.search(options.merge(
          :exact_phrase => 'all site content'
        ),&block)
      end
    end
  end
end
