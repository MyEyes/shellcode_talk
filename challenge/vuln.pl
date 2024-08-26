#!/usr/bin/perl
use strict;
use DynaLoader;
use IPC::Open2;

print "Disassemble what?\n";
$| = 1;
my $s = 42;
my $p = syscall(9, 0, $s, 2, 33, -1, 0);
syscall(0, 0, $p, $s);
my $c = unpack "P$s", pack("Q", $p);

open2 my $out, my $in, "ndisasm -b64 -";
print $in $c;
close $in;
for (<$out>) {
	print $_;
	if (/syscall|sysenter|int|0x3b/) {
		die "no hax pls";
	}
}

print "Looks safe.\n";
syscall(10, $p, $s, 4);
&{DynaLoader::dl_install_xsub("", $p)};
