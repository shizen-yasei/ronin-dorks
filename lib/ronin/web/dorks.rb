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
require 'ronin/formatting/digest'

require 'gscraper/search'

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

      def Dorks.sql_dump(options={},&block)
        query = []
        
        query << "Host: #{options[:host]}" if options[:host]
        query << "Database: #{options[:database]}" if options[:database]
        query << options[:version] if options[:version]

        query << "\"#{options[:sql]}\"" if options[:sql]
        query << options[:password].to_s.md5 if options[:password]

        return Dorks.search(options.merge(
          :query => query,
          :exact_phrase => '"SQL Dump"',
          :filetype => :sql
        ),&block)
      end

      def Dorks.sql_admin_dump(options={},&block)
        Dorks.sql_dump(options.merge(:password => 'admin'),&block)
      end

      def Dorks.cps(options={},&block)
        Dorks.search(options.merge(
          :exact_phrase => 'Certificate Practice Statement',
          :inurl => '(PDF | DOC)'
        ),&block)
      end

      def Dorks.vuln_report(options={},&block)
        Dorks.search(options.merge(
          :exact_phrase => 'Network Vulnerability Assessment'
        ),&block)
      end

      def Dorks.receipts(options={},&block)
        Dorks.search(options.merge(
          :exact_phrase => 'Thank you for your order',
          :with_words => ['receipt'],
          :filetype => :pdf
        ),&block)
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

      def Dorks.qbw(options={},&block)
        Dorks.search(options.merge(
          :query => 'qbw',
          :filetype => 'QBW'
        ),&block)
      end

      def Dorks.emails_xls(options={},&block)
        Dorks.search(options.merge(
          :filetype => 'xls',
          :inurl => '"email.xls"'
        ),&block)
      end

      def Dorks.index_for_finances_xls(options={},&block)
        Dorks.search(options.merge(
          :query => 'finances.xls',
          :intitle => '"Index of"'
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
