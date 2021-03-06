### 0.1.3 / 2009-09-24

* Require ronin >= 0.3.0.
* Require rspec >= 1.2.8.
* Require yard >= 0.2.3.5.
* Moved to YARD based documentation.
* Removed requirement on ronin-web.
* Updated the project summary and 3-point description for Ronin Dorks.

### 0.1.2 / 2009-07-02

* Use Hoe >= 2.0.0.
* Added Web::Dorks.intext.
* Added Web::Dorks.allintext.
* Added Web::Dorks.string_intext.
* Added Web::Dorks.all_strings_intext.
* Added Web::Dorks.intitle.
* Added Web::Dorks.allintitle.
* Added Web::Dorks.string_intitle.
* Added Web::Dorks.all_strings_intitle.

### 0.1.1 / 2009-02-23

* Added a git style sub-command (<tt>ronin-dorks</tt>) which starts the
  Ronin console with <tt>ronin/dorks</tt> pre-loaded.
* Added Dorks.all_strings_inurl.
* Added Dorks.index_of.
* Added Dorks.index_with_file.
* Added Dorks.index_with_sql.
* Added Dorks.sharepoint.
* Require GScraper >= 0.2.2.
* Require Ronin >= 0.2.1.
* Require Ronin Web >= 0.1.1.
* Renamed Dorks.mysql_dump to Dorks.sql_dump.
* Renamed Dorks.mysql_dump_admin to Dorks.sql_admin_dump.
* Fixed many small bugs.
* Updated README.txt.
* Added RSpec tests.

### 0.1.0 / 2008-08-21

* Initial release.
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

