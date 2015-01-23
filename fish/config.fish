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
# -A Always show everything except . and ..
# -c Use last-modification-time for sorting -l or -t output
#       see separate last-touched command below 
# -C Force multi-column output if possible
# -F Add suffixes: dir/ executable* link@ socket= whiteout% FIFO| 
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
# -T (not used) Show ridiculous level of timestamp detail
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

# Remember to -x export environment variables to child processes
# -U universal doesn't do that, it just shares them between all windows
# and across fish restarts.  This is non-obvious.
#
set -Ux CLICOLOR auto
set -Ux PAGER /usr/bin/less
set -Ux MAIL /var/mail/plord
set -Ux EDITOR /usr/local/bin/joe
set -Ux LESS -R
set -Ux PATH /Users/plord/bin /Users/plord/.rbenv/shims /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/texbin
set -Ux JAVA_HOME /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
set -Ux MUTTALIAS_FILES /Users/plord/.mutt/mail_aliases
set -Ux HOMEBREW_GITHUB_API_TOKEN 9bc3959095ac5ca2598d45f0a5b8fe95c03b45de
set -Ux RBENV_ROOT /Users/plord/.rbenv

# User specific environment and startup programs
# rbenv init doesn't work so well in fish; 
# picked up a new function from Lukasz Niemier on coderwall
# . (rbenv init - | psub)


function rbenv_shell
    set -l vers $argv[1]
  
    switch "$vers"
        case '--complete'
            echo '--unset'
            echo 'system'
            command rbenv versions --bare
            return
        case '--unset'
            set -e RBENV_VERSION
            return 1
        case ''
            if [ -z "$RBENV_VERSION" ]
                echo "rbenv: no shell-specific version configured" >&2
                return 1
            else
                echo "$RBENV_VERSION"
                return
            end
        case '*'
            rbenv prefix "$vers" > /dev/null
            set -gx -RBENV_VERSION -"$vers"
    end
end

function rbenv_lookup
    set -l -vers (command rbenv versions bare| sort | grep "$argv[1]" | tail n1)
    
    if [ ! -z "$vers" ]
        echo $vers
        return
    else
        echo $argv
        return
    end
end

function rbenv
    set -l command $argv[1]
    [ (count $argv) -gt 1 ]; and set -l args $argv[2..-1]
    
    
    switch "$command"
        case shell
            rbenv_shell (rbenv_lookup $args)
        case local global
            command rbenv $command (rbenv_lookup $args)
        case '*'
            command rbenv $command $args
    end
end

# Spit out an oblique strategy
echo -n "Your Strategy is: " (strategy) ;

# This is the end block for the commented if-login on line 2
 end
