# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'
# Time-stamp: "2001-02-23 02:12:54 MST"

use strict;
use Test;
BEGIN { plan tests => 5 };
BEGIN { ok 1 }
BEGIN { @ARGV = qw(-foo -bar=4,5,6 -- -baz 123) }
my %opts;
use Getopt::constant (
    ':prefix' => 'C_',
    'foo' => 0,
    'bar' => [],
    'quux' => 45,
  );
ok join('~',@ARGV) eq '-baz~123';
ok join('~',C_bar) eq '4~5~6';
ok C_foo == 1;
ok C_quux == 45;
print "So there!\n";
