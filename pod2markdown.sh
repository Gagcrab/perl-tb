#!/usr/bin/env sh
# Very simple shell script to convert POD documentation embedded in a perl
# script or module to a markdown README, for use with Github.
#
# Author: Michael Suzzi
# Last modified: 2022-03-04
#
# Usage: pod2markdown.sh <name of perl script containing POD> 
#
echo "Converting POD to markdown..."

if [ $# -eq 0 ]; then
	echo "No perl file specified"
	exit 1
fi

if perl -MPod::Markdown -e 'Pod::Markdown->new->filter(@ARGV)' "$1" > README.md; then
    	echo "Success" >&2
    	exit 0
else
	echo "Failure" >&2
	exit 255
fi
