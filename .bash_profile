#export PS1=">"
export PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPAGER="col -b | view -c 'set ft=man nomod nolist' -" 
export CLICOLOR=1
export JAVA_HOME=/Library/Java/Home
export GRAILS_HOME=~/local/grails
export PATH=$GRAILS_HOME/bin:$PATH
#export LESS=-RX

alias gem-server="gem server --daemon"
alias ci="git commit -a -m"
alias cii="git commit --interactive"
alias st="git status -u"
alias stt="git diff --name-status -r"
alias dfwi="git diff"
alias dfir="git diff --cached"
alias dfwt="git diff HEAD"
alias add="git add ."
alias addp="git add --patch"
alias push?='git cherry -v origin/master'
alias pull="git pull --rebase"
alias tag="git tag -a"
alias reset="git reset --hard"
alias netstat="netstat -nal -p tcp && netstat -nal -p udp"

set -o vi

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
