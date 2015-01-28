### Fish shell config
### Contributions from Lukasz Niemier & Justin Mayer
###

if status --is-interactive

## Short function definitions 
## replaces the alias command in other shells
##
## functions can use `command` to alter the behavior of a specific command 
## functions allow you to call $argv in mid (see `f` for a trivial example)

# clean up editor backup files
#
function clean
	 rm -i *~ .??*~
end

# find command shortcut, from antiquity
#
function f
    find . -name $argv -print
end

# arguably nonessential; fish sorts backwards; improve if possible
#
function h
    history
end

## General ls args
## -A Always show everything except . and ..
## -c Use last-modification-time for sorting -l or -t output
##       see separate last-touched command below 
## -C Force multi-column output if possible
## -F Add suffixes: dir/ executable* link@ socket= whiteout% FIFO| 
## (removed) -G forces colorized output to term; set with CLICOLOR var below
#
function ls
    command ls -AcCF $argv
end

# Redundant; handles typos and muscle memory faults from prior use
#
function la
    command ls -AcCF $argv
end

# Long listing
# -h Uses Byte/KB/MB/TB/PB suffixes for filesize (base 2 calculations)
# -l long format
#
function ll
    command ls -AcCFhl $argv
end

# Reverse sort long list by time 
# -t sort by last-modified time
# -r reverse the sort; last modified at the bottom
#
function lr
    command ls -AcCFhltr $argv
end

# Reverse sort long listing by increasing size
#
function filesize
    command ls -AcCFlSr $argv
end

# Reverse sort long list by access time (not modification time)
#
function last-touched
	 command ls -AcCFGhlrtu $argv
end

# Ship nethack bones files to a central server and retrieve new ones
#
function hearse
	 command hearse -c ~/.hearse --run-as-me
end

# most-used alias ever...
#
function m
    mutt
end

## typo defense
## make colorization moved to grc functions
## 
alias mkae make
alias Make make
alias Mkae make

alias more less
alias mroe less
alias More less
alias Mroe less

# Make grep and its aliases colorful, and add one line of context before 
# and after
#
function grep
    command grep -C1 --color=auto $argv
end

function grpe
    grep -C1 --color=auto $argv
end

function Grep
    grep -C1 --color=auto $argv
end

function Grpe
    grep -C1 --color=auto $argv
end

# a ps-grep shortcut; no -C context, we want isolated output
#
function pid
	 ps axww | grep --color=auto $argv
end

# obvious...
#
function po
	 popd
end

function pu
	 pushd
end


## Remember to -x export environment variables to child processes
## -U universal doesn't do that, it just shares them between all windows
## and across fish restarts.  This is non-obvious.
##
## Curiously the -g seems to work where -U does not?
## 

set -gx CLICOLOR auto
set -gx PAGER /usr/bin/less
set -gx MAIL /var/mail/plord
set -gx EDITOR /usr/local/bin/joe
set -gx LESS -R
set -gx PATH /Users/plord/.nodenv/bin /Users/plord/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/texbin
set -gx JAVA_HOME /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
set -gx MUTTALIAS_FILES /Users/plord/.mutt/mail_aliases
set -gx HOMEBREW_GITHUB_API_TOKEN 9bc3959095ac5ca2598d45f0a5b8fe95c03b45de
set -gx RBENV_ROOT /Users/plord/.rbenv
set -Ugx PYENV_ROOT /Users/plord/.pyenv
set -Ugx PYENV_SHELL fish

## User specific environment and startup programs

# picked up a new fish-specific rbenv functions from Lukasz Niemier on 
# coderwall; moved to functions directory

## all your env are belong to us
## pyenv suggests the longer form below.
#
status --is-interactive; and . (rbenv init -|psub)
rbenv version

status --is-interactive; and . (pyenv init -|psub)
pyenv version

status --is-interactive; and . (nodenv init -|psub)
nodenv version

# Spit out an oblique strategy
echo -n "Your Strategy is: " (strategy) ;

# This is the end block for the commented if-login on line 2
end
