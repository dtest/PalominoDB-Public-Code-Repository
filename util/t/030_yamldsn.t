# 030_yamldsn.t
# Copyright (C) 2013 PalominoDB, Inc.
# 
# You may contact the maintainers at eng@palominodb.com.
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
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use strict;
use warnings FATAL => 'all';
use Test::More tests => 8;
use TestUtil;
BEGIN {
  use_ok('YAMLDSN');
}

my $ydsn = new_ok('YAMLDSN');

eval {
  $ydsn->open(TestUtil::get_files_dir() .'/yamldsn/local_dsn.yml');
};
ok(!$@, 'parse basic');

eval {
  $ydsn->open(TestUtil::get_files_dir() .'/yamldsn/custom_keys_dsn.yml');
};
ok(!$@, 'parse with custom keys');

eval {
  is($ydsn->server_checksum('s1'), 1, 'checksum key is y');
};

ok(!$@, 'server custom key');

eval {
  is($ydsn->cluster_backup('c1'), 1, 'backup key is y');
};

ok(!$@, 'cluster custom key');
