#
#--
# Ronin Dorks - A Ruby library for Ronin that provides support for various
# Google (tm) Dorks functionality.
#
# Copyright (c) 2008 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'json'
require 'gscraper/search'

module Ronin
  module Web
    module Dorks
      include GScraper

      def Dorks.index_of_cgi_bin(options={},&block)
        Search.ajax_query(options.merge(:exact_phrase => 'Index of cgi-bin'),&block)
      end

      def Dorks.mysql_dump(options={},&block)
        query = []
        
        query << "Host: #{options[:host]}" if options[:host]
        query << "Database: #{options[:database]}" if options[:database]
        query << options[:version] if options[:version]

        query << "\"#{options[:sql]}\"" if options[:sql]
        query << options[:password].to_s.md5 if options[:password]

        return Search.query(options.merge(:query => query,
                                          :exact_phrase => '"#mysql dump"',
                                          :filetype => :sql),&block)
      end

      def Dorks.mysql_dump_admin(options={},&block)
        Dorks.mysql_dump(options.merge(:password => :admin),&block)
      end

      def Dorks.cps(options={},&block)
        Search.ajax_query(options.merge(:exact_phrase => 'Certificate Practice Statement',
                                        :inurl => '(PDF | DOC)'),&block)
      end

      def Dorks.vuln_report(options={},&block)
        Search.ajax_query(options.merge(:exact_phrase => 'Network Vulnerability Assessment'),&block)
      end

      def Dorks.receipts(options={},&block)
        Search.ajax_query(options.merge(:exact_phrase => 'Thank you for your order',
                                        :with_words => ['receipt'],
                                        :filetype => :pdf),&block)
      end

      def Dorks.robots_txt(options={},&block)
        Search.ajax_query(options.merge(:exact_phrase => 'robots.txt',
                                        :with_words => ['Disallow'],
                                        :filetype => :txt),&block)
      end

      def Dorks.php_my_admin(options={},&block)
        Search.ajax_query(options.merge(:with_words => ['phpMyAdmin'],
                                        :exact_phrase => 'running on',
                                        :inurl => 'main.php'),&block)
      end

      def Dorks.qbw(options={},&block)
        Search.ajax_query(options.merge(:query => 'qbw',
                                        :filetype => 'QBW'),&block)
      end

      def Dorks.emails_xls(options={},&block)
        Search.ajax_query(options.merge(:filetype => 'xls',
                                        :inurl => '"email.xls"'),&block)
      end

      def Dorks.index_for_finances_xls(options={},&block)
        Seach.ajax_query(options.merge(:query => 'finances.xls',
                                       :intitle => '"Index of"'),&block)
      end

      def Dorks.download_file(options={},&block)
        Search.ajax_query(options.merge(:allinurl => ['download.php?',
                                                      'file']),&block)
      end

      def Dorks.download_pdf(options={},&block)
        Search.ajax_query(options.merge(:allinurl => ['download.php?',
                                                      'file',
                                                      '.pdf']),&block)
      end
    end
  end
end
