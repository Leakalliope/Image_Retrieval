#!/usr/bin/perl -w

# dezippe ou detare tous les fichiers d'une arborescence
# unzip all archives from a folder and its subfolders

# use strict;
use warnings;
use 5.010;


use Data::Dumper;
use Path::Class;
use Parallel::ForkManager;

# Pour avoir un affichage correct sur STDOUT
binmode(STDOUT, ":utf8");


# INPUT folder
my $DOCS = "DOCS"; # repertoire de stockage des documents

# n° of documents analysed
my $nbDoc=0; # nbre de documents traités


if(scalar(@ARGV)!=1){
	die "Usage: perl unzip.pl IN
	IN: input folder

	";
}
while(@ARGV){
	$DOCS=shift;

	if(-e $DOCS){
		print "Reading $DOCS...\n";
	}
	else{
		die "## $DOCS does not exist!\n";
	}
}

print "\n-----------------------------\n";

my $pm = new Parallel::ForkManager(4);

my $dir = dir($DOCS);
$dir->recurse(depthfirst => 1, callback => sub {
	my $obj = shift;
	#say $obj;
	my $cmd;

	if (not ($obj->is_dir)) {
	    my $file = $obj->basename;
	    print "\n".$file."... ";
	    if  (index($file, ".zip") != -1) {
		     $cmd =  "\n unzip ".$obj." -d ".$DOCS."/".(substr $file,0,length($file)-4 );}
		 elsif  (index($obj->basename, ".gz") != -1) {
		 	  $cmd =  "\n gunzip ".$obj;}
		 else {return}
		 say $cmd;
		 $pm->start and next; # do the fork
		 system $cmd;
		 $pm->finish; # do the exit
		 $nbDoc++;
		}

	});

$pm->wait_all_children;

print "\n-----------------------------\n";
print "$nbDoc documents :\n";

print "=============================\n";
# FIN
