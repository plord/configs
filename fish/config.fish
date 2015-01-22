# Not sure we want this limitation? 
# if status --is-login

# clean up joe editor backup files
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

# General ls args
# -A everything except . and ..
# -c Uses last-modification-time for sorting -l or -t output
#       see separate last-touched command below 
# -C force multi-column output if possible
# -F suffiexes: dir/ executable* link@ socket= whiteout% FIFO| 
# (removed) -G forces colorized output to term; set with CLICOLOR var below
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
# -T
function ll
    command ls -AcCFhl $argv
end

# Reverse sort long list by time 
# -t sort by lasy-modified time
# -r reverse the sort; last modified at the bottom
#
function lr
    command ls -AcCFhltr $argv
end

# Reverse sort long listing by increasing size
#
function filesize
    command ls -AcCFlSr
end

# Long listing reverse-sorted by access time, bot modification time 
#
function last-touched
	 command ls -AcCFGhlrtu $argv
end

# Ship nethack bones files to a central server and retrieve new ones
#
function bones
	 hearse -c ~/.hearse --run-as-me
end

# most-used alias ever...
#
function m
    mutt
end

# typo defense and colorization
# 
function mkae
    grc make $argv
end

# `more` == `less` plus typo defense
# 
function more
    less $argv
end

function mroe
    less $argv
end

function More
    less $argv
end

function Mroe
    less $argv
end

# Make grep and its aliases colorful
#
function grep
    command grep -C2 --color=auto $argv
end

function grpe
    grep -C2 --color=auto $argv
end

function Grep
    grep -C2 --color=auto $argv
end

function Grpe
    grep -C2 --color=auto $argv
end

# a ps-grep shortcut
#
function pid
	 ps auww | grep -C2 --color=auto $argv
end

# obvious...
#
function po
	 popd
end

function pu
	 pushd
end

set -U CLICOLOR
set -U PAGER /usr/bin/less
set -U MAIL /var/mail/plord
set -U EDITOR /usr/local/bin/joe
set -U LESS -R
set -U PATH /Users/plord/bin /Users/plord/.rbenv/bin /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/texbin
set -U JAVA_HOME /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
set -U MUTTALIAS_FILES /Users/plord/.mutt/mail_aliases
set -U HOMEBREW_GITHUB_API_TOKEN 9bc3959095ac5ca2598d45f0a5b8fe95c03b45de
set -U RBENV_ROOT /Users/plord/.rbenv

# User specific environment and startup programs

. (rbenv init - | psub)

echo -n "Your Strategy is: " (strategy) ;

# This is the end block for the commented if-login on line 2
# end

