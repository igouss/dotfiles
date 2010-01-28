source ~/.bash_completion.d/git-completion.sh
source ~/.bash_completion.d/todo_completer.sh
source ~/.alias
# append to the history file, don't overwrite it
shopt -s histappend

#export PS1=">"
export PS1='[\W$(__git_ps1 " (%s)")]\$ '
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH

export CLICOLOR=1
export JAVA_HOME=/Library/Java/Home

# 30	black 31	red 32	green 33	yellow 34	blue 35	purple 36	cyan 37	white
# export GREP_COLOR="38;5;245"
export GREP_COLOR="32"

export GREP_OPTIONS="--color=auto"
export EDITOR=vim
export HISTCONTROL=ignoredups
# see http://www.macosxhints.com/article.php?story=20031025162727485
export CLICOLOR=1
#export LSCOLORS=gxfxcxdxbxegedabagacad
export LSCOLORS=DxGxcxdxCxcgcdabagacad
#export LESS=-RX

complete -F _todo_sh -o default t

export MANPAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

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

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH
