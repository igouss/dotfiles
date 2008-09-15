source ~/.bash_completion.d/git-completion.sh
source ~/.bash_completion.d/todo_completer.sh

#export PS1=">"
export PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPAGER="col -b | view -c 'set ft=man nomod nolist' -" 
export CLICOLOR=1
export JAVA_HOME=/Library/Java/Home
export GRAILS_HOME=~/local/grails
export GROOVY_HOME=~/local/groovy
export JRUBY_HOME=~/local/jruby
export PATH=$GROOVY_HOME/bin:$GRAILS_HOME/bin:$PATH
export PATH=$JRUBY_HOME/bin:$PATH
export GREP_COLOR="38;5;245"
export GREP_OPTIONS="--color=auto"
export EDITOR=vim
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
alias rebase="git rebase -i "
alias rebaseok="git rebase --continue"
alias rollback="git reset --hard"
alias co="git checkout"
alias clean="git clean -n -d"
alias clean!="git clean -d"
alias push="git push"
#alias reset="git reset HEAD^"
alias reset="git reset --hard HEAD^"
alias grm="git ls-files -deleted | xargs git rm"
alias append="git commit --amend"
alias conflict="git mergetool --tool=vimdiff"
alias p='~/bin/todo.py'
alias pls='~/bin/todo.py ls'
alias pla='~/bin/todo.py lsa'
alias pad='~/bin/todo.py add'
alias prm='~/bin/todo.py rm'
alias pb='~/bin/todo.py b'

alias vimm="vim +Vexplore"
alias netstat="netstat -nal -p tcp && netstat -nal -p udp"
alias ..='cd ..'
complete -F _todo_sh -o default t

function digg() { pushd ~/apps/digg ; grails $@; popd; }

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
alias =clear
p birdseye
