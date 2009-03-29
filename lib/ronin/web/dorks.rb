#
#--
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
#++
#

require 'ronin/web/web'
require 'ronin/extensions/uri'

require 'gscraper/search'
require 'digest/md5'

module Ronin
  module Web
    module Dorks
      include GScraper

      #
      # Creates either a <tt>GScraper::Search::WebQuery</tt> or a
      # <tt>GScraper::Search::AJAXQuery</tt> with the given _options_.
      # If a _block_ is given, it will be passed the newly created 
      # query object.
      #
      # _options_ may contain the following keys:
      # <tt>:ajax</tt>:: Specifies wether or not to create a
      #                  <tt>GScraper::Search::AJAXQuery</tt>.
      # <tt>:query</tt>:: The search query.
      # <tt>:link</tt>:: Search for results which link to the specified
      #                  URI.
      # <tt>:related</tt>:: Search for results which relate to the
      #                     specified URI.
      # <tt>:info</tt>:: Return information about the specified URI.
      # <tt>:site</tt>:: Limit results to the specified site.
      # <tt>:filetype</tt>:: Limit results to those with the specified
      #                      file-type.
      # <tt>:allintitle</tt>:: Search for results with all of the keywords
      #                        appearing in the title.
      # <tt>:intitle</tt>:: Search for results with the keyword appearing
      #                     in the title.
      # <tt>:allintext</tt>:: Search for results with all of the keywords
      #                       appearing in the text.
      # <tt>:intext</tt>:: Search for results with the keyword appearing
      #                    in the text.
      # <tt>:allinanchor</tt>:: Search for results with all of the keywords
      #                         appearing in the text of links.
      # <tt>:inanchor</tt>:: Search for results with the keyword appearing
      #                      in the text of links.
      # <tt>:exact_phrase</tt>:: Search for results containing the specified
      #                          exact phrase.
      # <tt>:with_words</tt>:: Search for results containing all of the
      #                        specified words.
      # <tt>:without_words</tt>:: Search for results not containing any of
      #                           the specified words.
      # <tt>:numeric_range</tt>:: Search for results contain numbers that
      #                           fall within the specified Range.
      # <tt>:define</tt>:: Search for results containing the definition of
      #                    the specified keyword.
      #
      # If the <tt>:ajax</tt> option is not specified, then _options_
      # may contain the following additional keys:
      # <tt>:results_per_page</tt>:: Specifies the number of results
      #                              for each page.
      # <tt>:language</tt>:: Search for results in the specified language.
      # <tt>:region</tt>:: Search for results from the specified region.
      # <tt>:within_past_day</tt>:: Search for results that were created
      #                             within the past day.
      # <tt>:within_past_week</tt>:: Search for results that were created
      #                              within the past week.
      # <tt>:within_past_month</tt>:: Search for results that were created
      #                               within the past month.
      # <tt>:within_past_year</tt>:: Search for results that were created
      #                              within the past year.
      # <tt>:occurrs_within</tt>:: 
      # <tt>:rights</tt>:: Search for results licensed under the specified
      #                    license.
      # <tt>:filtered</tt>:: Specifies whether or not to use SafeSearch.
      #                      Defaults to +false+, if not specified.
      #
      # If the <tt>:ajax</tt> option is specified, then _options_
      # may contain the following additional keys:
      # <tt>:language</tt>:: The search language. Defaults to <tt>:en</tt>.
      # <tt>:sig</tt>:: The search signature. Defaults to
      #                 <tt>582c1116317355adf613a6a843f19ece</tt>.
      # <tt>:key</tt>:: The search key. Defaults to <tt>:notsupplied</tt>.
      # <tt>:version</tt>:: The desired API version. Defaults to
      #                     <tt>1.0</tt>.
      #
      def Dorks.search(options={},&block)
        if options[:ajax] == true
          return Search.ajax_query(options,&block)
        else
          return Search.query(options,&block)
        end
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

      def Dorks.all_strings_inurl(patterns,options={},&block)
        Dorks.search(options.merge(:allinurl => patterns.map { |pattern|
          "'#{pattern}'"
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
