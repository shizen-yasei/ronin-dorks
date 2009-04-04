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

require 'ronin/web/dorks/dorks'

module Ronin
  module Web
    module Dorks
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
    end
  end
end
