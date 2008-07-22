export PS1=">"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPAGER="col -b | view -c 'set ft=man nomod nolist' -" 
alias bt=/Users/i_gouss/local/git-issues/git-issues
#alias console=script/console
#alias generate=script/generate
alias commit="git commit -a -m"
alias commiti="git commit --interactive"
alias status="git status -u"
alias giff="git diff"
alias giffc="git diff --cached"
alias add="git add ."
alias addp="git add --patch"
set -o vi
export CLICOLOR=1
export JAVA_HOME=/Library/Java/Home
export LESS=-RX
alias gem-server="gem server --daemon"
alias netstat="netstat -nal -p tcp && netstat -nal -p udp"

export GRAILS_HOME=~/local/grails
export PATH=$GRAILS_HOME/bin:$PATH

#run "sudo visudo" and add the line
#Defaults        env_keep += "JAVA_HOME"


if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi
ruby -e'include Math;(-7..30).each{|y|s="";\
(26..100).each{|x|s<<" .,:+*%xX08@"[ \
((sin(x/8.0)+2+sin(y*x/2.0))**       \
(sin(y/7.0)+1)*12/16.0)]};puts s}'
alias
