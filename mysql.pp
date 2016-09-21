# /etc/puppetlabs/code/environments/production/manifests/mysql.pp:

node 'node1.mihura.com' {
  class { '::mysql::server':
    root_password    => 'Mp2341943',
    override_options => { 'mysqld' => { 'max_connections' => '1024' } },
  }

# Create database
 mysql_database { 'test_mdb':
   ensure  => 'present',
   charset => 'utf8',
 }

# Create database user
 mysql_user { 'test_user@:localhost':
   ensure => 'present',
 }

# Grant "test_user" access to "test_mdb"
 mysql_grant { 'test_user@localhost/test_mdb.*':
   ensure     => 'present',
   options    => ['GRANT'],
   privileges => ['ALL'],
   table      => 'test_mdb.*',
   user       => 'test_user@localhost',
 }
}

