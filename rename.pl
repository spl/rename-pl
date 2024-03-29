#!/usr/bin/perl -w
#
# Usage: rename perlexpr [files]

my $regexp;

($regexp = shift @ARGV) || die "Usage:  rename perlexpr [filenames]\n";

if (!@ARGV) {
   @ARGV = <STDIN>;
   chomp(@ARGV);
}


foreach $_ (@ARGV) {
   my $old_name = $_;
   eval $regexp;
   die $@ if $@;
   rename($old_name, $_) unless $old_name eq $_;
}

exit(0);
