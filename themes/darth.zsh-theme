# Found on the ZshWiki
#  http://zshwiki.org/home/config/prompt
#

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
project_pwd() {
  echo $PWD | sed -e "s/\/Users\/$USER/~/" -e "s/~\/projects\/\([^\/]*\)\/current/\\1/" -e "s/~\/Sites\/\([^\/]*\)\/current/http:\/\/\\1/"
}

ruby_version() {
  echo " $(ruby -v | awk '{print $2}')"
}
#
# ACTUAL CUSTOMIZATION OH NOES!
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

grb_git_prompt() {
#    local g="$(__gitdir)"
    local g=".git"
#    if [ -n "$g" ]; then
        local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
        if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
            local COLOR=${RED}
        elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
            local COLOR=${YELLOW}
        else
            local COLOR=${GREEN}
        fi
        local SINCE_LAST_COMMIT="${COLOR}$(minutes_since_last_commit)m${NORMAL}"
        # The __git_ps1 function inserts the current git branch where %s is
        echo $SINCE_LAST_COMMIT
#    fi
}


local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

# what is the `i v g` for rvm-prompt?
RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt i v g)$(~/bin/git-cwd-info.rb)%{$reset_color%}'



# export PROMPT="$fg[reset_color]macbook: %~   $(git_prompt_info)
# ~ "
# export RPROMPT=$'%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%} $(git_cwd_info)%{\e[0m%}'

