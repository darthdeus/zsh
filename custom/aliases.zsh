if [ `uname` = 'Darwin' ]; then
  alias ls='ls -G'
  alias du='du -k -d 1 $argv'
else
  alias ls='ls --color=auto'
  alias du='du -k --max-depth=1 $argv'
fi

alias l='ls'
alias ll='ls -lh'
alias la='ls -a'
alias lal='ls -lah'

alias s='git status -sb $argv; return 0'
alias d='gd $argv'
alias m='mate . $argv'

#alias df='df -kh $argv'
alias reload_webkit="osascript -e \"tell application 'WebKit' to do JavaScript 'window.location.reload()' in front document\""
#alias tigs='tig status $argv'

#alias add_alias='mate -w ~/.zsh/aliases; cd ~/.dot-files; ga files/.zsh/aliases; gc'
#alias git_alias='mate -w ~/.zsh/git_aliases; cd ~/.dot-files; ga files/.zsh/git_aliases; gc'

# IP related stuff
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias flush="dscacheutil -flushcache"

alias gzip="gzip -9n"
alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook

alias branches='git log --graph --full-history --all --color  --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

alias mongod="nocorrect mongod"
alias subl="nocorrect subl"
alias vagrant="nocorrect vagrant"

alias tf="tail -F"

alias r="bundle exec rails"
alias rg="rvm gemset"

alias scvload="ssh li 'top -bn 1 | head -n 5'"

function gdd() {
  git diff $1@{1}..$1
}

alias t="tmux"
alias ta="tmux attach"
alias tn="tmux new-session -s"

alias rs="bundle exec rspec spec"
alias cf="bundle exec cucumber features"
alias rb="rbenv"
alias re="rb"
alias rh="rbenv rehash"
alias p="powder"

alias b="bundle"
alias bi="bundle install"

alias time="gtime"
alias wisdom="fortune | cowsay | lolcat"
alias ct='ctags --extra=+f --language-force=Ruby -R $(bundle show --paths | xargs) app lib'

# alias git=hub
alias md='kill -s USR1 $(ps -ef | grep main.js | grep node | tr -s " " | cut -f 4 -d " ")'
