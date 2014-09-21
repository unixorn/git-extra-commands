# Copyright 2006-2013 Joseph Block <jpb@apesseekingknowledge.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# What platform are we on?
on_linux() { [[ "$(uname -s)" = "Linux"  ]] }
on_osx()   { [[ "$(uname -s)" = "Darwin" ]] }

# check if a command is available
# function command_exists() { which "${1}" >/dev/null 2>/dev/null }

# check if this is an interactive session
# (tests if stdout is a tty)
# function is_interactive() { [ -t 1 ] }

# Add our plugin's bin diretory to user's path
PLUGIN_BIN="$(dirname $0)/bin"
export PATH=${PATH}:${PLUGIN_BIN}

if [[ "$(uname -s)" = "Darwin" ]]; then
  # do OS X specific things
  alias eject="diskutil eject"
  alias flushds="dscacheutil -flushcache"
  alias killSS='kill -9 `ps ww | grep ScreenSaverEngine | grep -v grep | awk "{print $1}"`'
  alias l-d="ls -lFaGd"
  alias l-h="ls -laFGh"
  alias l-l="ls -laFG"
  alias l="ls -laFG"
  alias ll="ls -lFa | TERM=vt100 less"
  alias mywireless="system_profiler SPAirPortDataType | awk -F\": \" '/Current Wireless Network/{print $2}'"
  alias ql='qlmanage -p'
  alias quicklook='qlmanage -p'
  alias spotlighter='mdfind -onlyin `pwd`'
  alias top='TERM=vt100 top'

  # clipboard manipulation
  alias gpaste="pbpaste | perl -pe 's/\r\n|\r/\n/g'"
  alias pbconvert="pbpaste | perl -pe 's/\r\n|\r/\n/g' | pbcopy"
  alias pbsort="pbpaste | sort | pbcopy"

  # Show/hide hidden files in Finder
  alias show_dotfiles="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
  alias hide_dotfiles="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

  # Hide/show all desktop icons for presenting
  alias show_desktop_icons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
  alias hide_desktop_icons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

  # sound
  alias mute="osascript -e 'set volume output muted true'"
  alias stfu="osascript -e 'set volume output muted true'"
  alias unmute="osascript -e 'set volume output muted false'"

  if [ -x '/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke' ]; then
    alias stroke='/System/Library/CoreServices/Applications/Network\ Utility.app/Contents/Resources/stroke'
  fi

  if [ -x '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' ]; then
    alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
  fi

  # homebrew stuff
  alias memcached_load="launchctl load -w /usr/local/Cellar/memcached/1.4.13/homebrew.mxcl.memcached.plist"
  alias memcached_unload="launchctl unload -w /usr/local/Cellar/memcached/1.4.13/homebrew.mxcl.memcached.plist"
  alias mysql_load="launchctl load -w /usr/local/Cellar/mysql/5.5.20/homebrew.mxcl.mysql.plist"
  alias mysql_unload="launchctl unload -w /usr/local/Cellar/mysql/5.5.20/homebrew.mxcl.mysql.plist"
  alias postgres_load="launchctl load -w /usr/local/Cellar/postgresql/9.1.3/homebrew.mxcl.postgresql.plist"
  alias postgres_unload="launchctl unload -w /usr/local/Cellar/postgresql/9.1.3/homebrew.mxcl.postgresql.plist"

  alias -g @NDL='~/Downloads/*(.om[1])'

  pledit() { # plist editor.
    if [ $# -ne 1 ]; then
      echo -e "pledit: Edit Apple plist file\nusage: pledit plist_filename"
    else
      sudo plutil -convert xml1 ${1}; # convert the binary file to xml
      sudo ${EDITOR} ${1}; # use the default editor
      sudo plutil -convert binary1 ${1} # convert it back to binary
    fi
  }

  # Manually remove a downloaded app or file from the quarantine
  function unquarantine() {
    for attribute in com.apple.metadata:kMDItemDownloadedDate com.apple.metadata:kMDItemWhereFroms com.apple.quarantine; do
      xattr -r -d "$attribute" "$@"
    done
  }

fi

if [[ "$(uname -s)" = "Linux"  ]]; then
  # we're on linux
  alias cputop="top -o cpu"
  alias l-d="ls -lFad"
  alias l="ls -la"
  alias l="ls -laF"
  alias ll="ls -lFa | TERM=vt100 less"
  alias ll="ls -la | less"
fi

alias historysummary="history | awk '{a[\$2]++} END{for(i in a){printf \"%5d\t%s\n\",a[i],i}}'| sort -rn| head -30"

# Use homebrew versions if present
if [ -x /usr/local/bin/mysql/bin/mysql ]; then
  alias mysql="/usr/local/mysql/bin/mysql"
fi
if [ -x /usr/local/bin/mysql/bin/mysqladmin ]; then
  alias mysqladmin="/usr/local/mysql/bin/mysqladmin"
fi

# Sue me, I like vim. Got tired of different *nix stuffing it in different
# places, so go through the usual suspects and create an alias when we find
# it.
if [ -x /bin/vim ]; then
  alias vi="/bin/vim"
  alias vim="/bin/vim"
  export EDITOR='/bin/vim'
fi

if [ -x /usr/bin/vim ]; then
  alias vi="/usr/bin/vim"
  alias vim="/usr/bin/vim"
  export EDITOR='/usr/bin/vim'
fi

# If there's a macports vim, it is almost certainly more current than the
# one Apple ships
if [ -x /opt/local/bin/vim ]; then
  alias vim='/opt/local/bin/vim'
  alias vi="/opt/local/bin/vim"
  export EDITOR='/opt/local/bin/vim'
fi

# Same for homebrew.
if [ -x /usr/local/bin/vim ]; then
  alias vim='/usr/local/bin/vim'
  alias vi="/usr/local/bin/vim"
  export EDITOR="/usr/local/bin/vim"
fi

export VISUAL=${EDITOR}

# Old-school OS9 Mac text files had a different line ending than *nix, deal with
# converting back and forth.
alias mac2unix="tr '\015' '\012'"
alias unix2mac="tr '\012' '\015'"

# IP address fiddling
alias external_ip="curl -s icanhazip.com"
alias my_ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias reattach='screen -r'
alias ssh="ssh -A"
alias sshnohostchecks="ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias stripcolors='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

alias wget="wget -c"

# git aliases
alias annotate="git annotate"
alias blame="git blame"
alias gadd="git add"
alias gci='git ci -v'
alias gdiff='git diff'
alias gitadd="git add"
alias gitci='git ci -v'
alias gitdiff='git diff'
alias gitlog="git log"
alias gitmerge="git merge"
alias gitpull="git pull"
alias gitpus="git push"
alias gitpush="git push"
alias gitrebase="git rebase"
alias gitst='git status'
alias glg="git log"
alias glog="git log"
alias gpull="git pull"
alias gpush="git push"
alias grebase="git rebase -i"
alias hlog='git log --all --date-order --graph --date=short --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ad%Creset %C(red bold)%d%Creset%s"'

# my common tyops
alias ..="cd .."
alias gerp='grep'
alias grep-i='grep -i'
alias grep='GREP_COLOR="1;37;41" LANG=C grep --color=auto'
alias grepi='grep -i'
alias knfie='knife'
alias maek='make'
alias psax='ps ax'
alias pswax='ps wax'
alias psxa='ps ax'
alias raek='rake'
alias tartvf="tar tvf"
alias tartvzf="tar tvzf"
alias tarxvf="tar xvf"

# Zap those damn .DS_Store files
zap_ds_store() {
  if [ -d ${1} ]; then
    find ${1} -type f -name '.DS_Store' -delete -ls
  fi
}

# from cads
ff() { find . -type f -iname '*'$*'*' -ls ; }

# Got tired of constantly doing history | grep X | tail
hgrep40() {
  history | grep -i "$@" | tail -40
}

hgrep() {
  history | grep -i "$@" | tail -20
}

rot13() {
  echo $1 | tr "A-Za-z" "N-ZA-Mn-za-m"
}

# SHA stuff
sha1() {
  echo -n $1 | openssl sha1 /dev/stdin
}

sha256() {
  echo -n $1 | openssl sha256 /dev/stdin
}

sha512() {
  echo -n $1 | openssl sha512 /dev/stdin
}

# from commandlinefu.com
watch() { t=$1; shift; while test :; do clear; date=$(date); echo -e "Every $ts: $@ \t\t\t\t $date"; $@; sleep $t; done }

cleanxmlclip() {
  pbpaste | tidy -xml -wrap 0 | pbcopy
}

calc() {
  awk "BEGIN{ print $* }" ;
}

procs_for_path() {
  for pid in $(lsof "$*" | cut -d' ' -f 3 | sort | uniq); do ps -f -p $pid; done
}

# begin sysadvent2011 functions
_awk_col() {
  echo "$1" | egrep -v '^[0-9]+$' || echo "\$$1"
}

sum() {
  [ "${1#-F}" != "$1" ] && SP=${1} && shift
  [ "$#" -eq 0 ] && set -- 0
  key="$(_awk_col "$1")"
  awk $SP "{ x+=$key } END { printf(\"%d\n\", x) }"
}

sumby() {
  [ "${1#-F}" != "$1" ] && SP=${1} && shift
  [ "$#" -lt 0 ] && set -- 0 1
  key="$(_awk_col "$1")"
  val="$(_awk_col "$2")"
  awk $SP "{ a[$key] += $val } END { for (i in a) { printf(\"%d %s\\n\", a[i], i) } }"
}

countby() {
  [ "${1#-F}" != "$1" ] && SP=${1} && shift
  [ "$#" -eq 0 ] && set -- 0
  key="$(_awk_col "$1")"
  awk $SP "{ a[$key]++ } END { for (i in a) { printf(\"%d %s\\n\", a[i], i) } }"
}
# end sysadvent

# Make easier to remember alias for removing entries from known_hosts
rmhost() {
  ssh-keygen -R "$@"
}

get_load() {
  uptime | awk '{print $11}' | tr ',' ' '
}

bash_repeat() {
  n=$1
  shift
  while [ $(( n -= 1 )) -ge 0 ]
  do
    "$@"
  done
}

# Deal with various stupidities

authme() {
  ssh "$1" 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' \
  < ~/.ssh/id_dsa.pub
}

mtr_url() {
  host=`ruby -ruri -e "puts (URI.parse('$1').host or '$1')"`
  sudo mtr -t $host
}

jsoncurl() {
  curl "$@" | python -m json.tool
}

# recursively touch, e.g. touch + mkdir -p
# so files can easily be created at depth
canhaz() {
  mkdir -p $(dirname "${1}") && touch "${1}"
}

canhaz_script() {
  mkdir -p $(dirname "${1}") && touch "${1}" && chmod +x "${1}"
}

pong() {
    ping -c 10 "$@"
}

show_terminal_colors() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolor${i}\n"
  done
}

# batch change extension
chgext() {
  for file in *.$1 ; do mv $file `echo $file | sed "s/\(.*\.\)$1/\1$2/"` ; done
}

# From Dan Ryan's blog - http://danryan.co/using-antigen-for-zsh.html
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

alias zh='fc -l -d -D'
alias -s pdf=open
alias edit="$EDITOR"' $(eval ${$(fc -l -1)[2,-1]} -l)'
alias knife='nocorrect knife'

# from: https://coderwall.com/p/hwu5uq?i=9&p=1&q=sort%3Ascore+desc&t%5B%5D=zsh
pjson() {
  if [ $# -gt 0 ];
    then
    for arg in $@
    do
      if [ -f $arg ];
        then
        cat $arg | python -m json.tool
      else
        echo "$arg" | python -m json.tool
      fi
    done
  fi
}

# from: https://vinipsmaker.wordpress.com/2014/02/23/my-zsh-config/
# bash prints ^C when you're typing a command and control-c to cancel, so it
# is easy to see it wasn't executed. By default, zsh doesn't print the ^C.
# Fortunately, it is easy to trap SIGINT.
TRAPINT() {
  print -n -u2 '^C'
  return $((128+$1))
}

alias hexpass="openssl rand -hex 24"

function sshaddme {
  ssh $1 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys" < ~/.ssh/id_?sa.pub  # '?sa' is a glob, not a typo!
}

# mkdir & cd
function mkcd {
    mkdir -p "$@" && cd $_
}

# delete .pyc and .pyo files
function pyclean {
  find . -name '*.pyc' -delete
  find . -name '*.pyo' -delete
}

function smite () {
  ps wax | grep ${1} | grep -v grep | awk '{print $1}' | xargs murder
}

alias python_module_path="echo 'import sys; t=__import__(sys.argv[1],fromlist=[\".\"]); print(t.__file__)'  | python - "
