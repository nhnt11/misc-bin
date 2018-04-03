ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

#RVM and git settings

function get_qtop {
  echo `cat .hg/patches/status | tail -1 | cut -f2 -d ':'`
}

function get_bookmark {
  echo "$(cat .hg/bookmarks.current 2>/dev/null)"
}

function together {
  QTOP="$(get_qtop)"
  BMK="$(get_bookmark)"
  if [ ! -z "$BMK" ] && [ ! -z "$QTOP" ]; then
    BMK="|$BMK"
  fi
  echo "$QTOP$BMK"
}

function vc_info {
  if [ -d ".hg" ]; then
    echo "%{$fg[yellow]%}$(together)%{$reset_color%}"
  else
    echo "$(git_custom_status)"
  fi
}

if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1='$(vc_info)%{$fg[red]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%} $EPS1'
else
  if which rbenv &> /dev/null; then
    RPS1='$(vc_info)%{$fg[red]%}[`rbenv version | sed -e "s/ (set.*$//"`]%{$reset_color%} $EPS1'
  else
    if [[ -n `which chruby_prompt_info` && -n `chruby_prompt_info` ]]; then
      RPS1='$(vc_info)%{$fg[red]%}[`chruby_prompt_info`]%{$reset_color%} $EPS1'
    else
      RPS1='$(vc_info) $EPS1'
    fi
  fi
fi

PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
