# Setting PATH for Python 3.2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"
export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Profile for sh
#export ENV=~/.bash_profile

PATH=/usr/local/squid/sbin:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/opt/local/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/3.2/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/android-sdk/tools:/usr/local/android-sdk/platform-tools
export BUILD_MAC_SDK_EXPERIMENTAL=1

PATH="/Users/nhnt11/bin:${PATH}"
export PATH

# Pretty colors in less
alias less='less -r'

# Convenience stuff for TB

export DEVDIR=~/Dev
export COMMCENTRALDIR=$DEVDIR/comm-central
export TBO=$COMMCENTRALDIR/obj-thunderbird
export TBDIST=$TBO/dist/Daily.app/Contents/MacOS/

alias stb='export THUNDERBIRD=1'
alias utb='unset THUNDERBIRD'
alias tbt='cd $TBDIST && ./thunderbird-bin --jsconsole'
alias cdcc='cd $COMMCENTRALDIR'
alias cdtbo='cd $TBO'
alias ibe='hg export qtip > ~/Desktop/$(hg qqtop)'
alias tbm="cdcc && ./mozilla/mach build && ./mozilla/mach run --jsconsole; telegram \"build complete\"" 
alias qdel='hg qdelete $(hg qnext)'

alias clobber='./mach clobber'
alias build='./mach build'
alias cbuild='./mach clobber && ./mach build'

# Pretty colors!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias ls='ls -GFh'

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# Firefox Dev
export FXTEAMDIR=$DEVDIR/m-u
export FXO=$FXTEAMDIR/obj-fx
export FXDIST=$FXO/dist/Nightly.app/Contents/MacOS
alias cdfx='cd $FXTEAMDIR'
alias cdfxo='cd $FXO'
alias cdbb='cd $FXO/browser/base'
alias fxt='cd $FXTEAMDIR && ./mach run'
alias fxp='cd $FXTEAMDIR && ./mach run -P'
alias clp='cd $FXTEAMDIR && rm -rf $FXO/tmp/scratch_user'
alias fxm='cdfx && ./mach build faster && fxt > /dev/null'
alias fxmp='cdfx && ./mach build faster && fxp > /dev/null'
alias fxmm='cdfx && ./mach build && fxt > /dev/null'
alias fxc='make -C . && fxt'

hg() {
  command hg --pager=no "$@";
  temp_file_wip="$(mktemp)";
  (bash -c "unbuffer command hg --pager=no wwip > $temp_file_wip; mv $temp_file_wip ./.___WIP___;" &);
  return 1;
}

alias mach='./mach'

alias _mx="printf '\e[9;1t';"
alias _rs="printf '\e[9;0t';"

source /Users/nhnt11/.cargo/env
