#if status --is-login

function g
	 git $argv
end

function clean
	 rm -i *~ .??*~
end

function f
	 find . -name $argv -print
end

function fm
	 fetchmail
end

function h
	 history
end

function la
	command ls -AcCFG $argv
end

function ll
	 command ls -AcCFGhls $argv
end

function lr
	 command ls -AcCFGhltr $argv
end

function ls
 command ls -AcCF $argv
end

function lt
	 command ls -AcCFGhltr $argv
end

function lu
	 command ls -AcCFGhlrtu $argv
end

function bones
	 hearse -c ~/.hearse --run-as-me
end

function m
	 mutt
end

function mkae
	 make $argv
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

function grpe
	 grep $argv
end

function Grep
	 grep $argv
end

function Grpe
	 grep $argv
end

function pid
	 ps auww | grep $argv
end

function po
	 popd
end

function pu
	 pushd
end

function tweet
	 t update $argv
end


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
#end

