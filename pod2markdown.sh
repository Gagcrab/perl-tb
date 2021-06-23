#!/usr/bin/env sh
# Very simple shell script to convert perl POD to markdown for Github.
echo "Converting POD to markdown..."
if perl -MPod::Markdown -e 'Pod::Markdown->new->filter(@ARGV)' tb > README.md; then
    echo "Success." >&2
    exit 0
else
    echo "Failure." >&2
    exit 255
fi
