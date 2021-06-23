# NAME

tb - Toolbox helper script for Fedora Silverblue

# VERSION

version 0.9.0

# SYNOPSIS

    tb [OPTIONS]... NUMBER COMMAND ARGUMENTS

    -r, --run                # run command inside toolbox
    -l, --list               # list installed toolboxes
    -v, --verbose            # use verbose mode
    -d, --debug              # use debug mode (for development)
    --version                # print version information
    -?, --help               # print this help message

Where _NUMBER_ is the number assigned to the toolbox you wish to enter, and _COMMAND_ is the command you wish to run inside the toolbox, followed by any arguments (requires --run switch to be specified).

Examples:

    tb 1                     # enter toolbox 1
    tb --run 2 /usr/bin/vim  # run '/usr/bin/vim' inside toolbox 2
    tb -l                    # prints contents of ~/.tb-perl file
    tb -r -- 3 nano -w %F    # run 'nano -w %F' inside toolbox 3

Note the double dashes in the final example, which tell tb to stop searching for options and to pass through '-w' as an argument to 'nano'.

# DESCRIPTION

This program was primarily designed to wrap Silverblue's toolbox utility and allow hostnames other than "toolbox". Additionally, the assignment of numbers to toolboxes makes command line usage faster and more convenient.

To work around [this bug](https://github.com/containers/toolbox/issues/586), set the hostname of the application's toolbox to your system hostname. Windows will now group correctly when apps are pinned to the GNOME Shell favourites.

## CONFIGURATION

Numbers are assigned to toolboxes via the tb-perl config file searched for in $XDG\_CONFIG\_HOME, falling back to ~/.config. Per line syntax is as follows:

    <toolbox name> <hostname>

Parts of each line are separated by spaces, with a newline for the next entry. Line number determines toolbox number. If a hostname is unspecified, it will default to the toolbox name. An example of a .tb-perl file:

    perl-dev perl-x550cc  # perl-dev is toolbox 1, hostname perl-x550cc
    java-dev java-x550cc  # java-dev is toolbox 2, hostname java-x550cc
    python-dev            # python-dev is toolbox 3, hostname python-dev

In this way, environment variables in your .bashrc can be set either machine wide (usin a regexp to match 'x550cc', in this case) or toolbox specific ('java', 'python', etc), and your toolboxes will still set your machine vars.

# AUTHORS

- Michael Suzzi <msuz.code@gmail.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2021 by Michael Suzzi.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
