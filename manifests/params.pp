# === Class: mediawiki::params
#
#  The mediawiki configuration settings idiosyncratic to different operating
#  systems.
#
# === Parameters
#
# None
#
# === Examples
#
# None
#
# === Authors
#
# Martin Dluhos <martin@gnu.org>
#
# === Copyright
#
# Copyright 2012 Martin Dluhos
#
class mediawiki::params {

  $tarball_url        = 'https://releases.wikimedia.org/mediawiki/1.26/mediawiki-1.26.2.tar.gz'
  $conf_dir           = '/etc/mediawiki'
  $installation_files = [
    'api.php',
    'api.php5',
    'docs',
    'extensions',
    'img_auth.php',
    'img_auth.php5',
    'includes',
    'index.php',
    'index.php5',
    'languages',
    'load.php',
    'load.php5',
    'maintenance',
    'mw-config',
    'opensearch_desc.php',
    'opensearch_desc.php5',
    'profileinfo.php',
    'redirect.php',
    'redirect.php5',
    'redirect.phtml',
    'resources',
    'serialized',
    'skins',
    'StartProfiler.sample',
    'tests',
    'thumb_handler.php',
    'thumb_handler.php5',
    'thumb.php',
    'thumb.php5',
    'vendor',
    'wiki.phtml',
  ]

  case $::operatingsystem {
    'redhat', 'centos':  {
      $web_dir            = '/var/www/html'
      $doc_root           = "${web_dir}/wikis"
      $packages           = ['php-gd', 'php-xml', 'curl', 'php-pecl-apcu', 'php-intl']
      $apache             = 'httpd'
      $apache_user        = 'apache'
    }
    'debian':  {
      $web_dir            = '/var/www'
      $doc_root           = "${web_dir}/wikis"
      $packages           = ['php5', 'php5-mysql', 'curl']
      $apache             = 'apache2'
      $apache_user        = 'www-data'
    }
    'ubuntu':  {
      $web_dir            = '/var/www'
      $doc_root           = "${web_dir}/wikis"
      $packages           = ['php5', 'php5-mysql', 'curl']
      $apache             = 'apache2'
      $apache_user        = 'www-data'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
