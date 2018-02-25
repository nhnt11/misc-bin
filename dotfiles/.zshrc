# WTF IS THIS::: # Ensure this is sourced before any other configuration occurs.
#if [ -e "$HOME/.bash_profile" ]; then source $HOME/.bash_profile; fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois_hg"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python mercurial brew adb cp zsh-autosuggestions)

# Load configuration from oh-my-zsh.
source $ZSH/oh-my-zsh.sh

ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="*"

function get_hg_qtop {
  echo "%{$fg[yellow]%}$(hg qtop &>/dev/null && hg qqtop)%{$reset_color%}"
}

function get_current_bookmark {
  echo "%{$fg[yellow]%}$(hg bookmarks | grep "*" | cut -d ' ' -f 3)%{$reset_color%}"
}

#RPROMPT='$(get_hg_qtop)$(get_current_bookmark)'

alias -s txt="open -a /Applications/TextEdit.app"

# Ensure this is sourced after other configuration occurs in case ZSH overrides
# configuration.
if [ -e "$HOME/.bash_profile" ]; then source $HOME/.bash_profile; fi

h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^\n' autosuggest-execute

fpath=(/usr/local/share/zsh-completions $fpath)