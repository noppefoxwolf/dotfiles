#alias
alias gcc="gcc -Wall"
alias ll="ls -l"
alias daemon-stat="sudo svstat /service/*"

#keybind
bindkey -e
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#zstyle
zstyle ':completion:*' list-colors 'di=36' 'ln=35'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
[ -f ~/.zshrc.include ] && source ~/.zshrc.include

#prompt
source ~/.git-prompt.sh
fpath=(~/.zsh/completion $fpath)
PROMPT='%F{208}%~$(__git_ps1) %% %f'
RPROMPT='%F{207}%M %*%f'

#history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt correct
setopt prompt_subst
setopt pushd_ignore_dups
setopt list_packed
setopt list_types
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

#autoload
autoload history-search-end
autoload -U compinit
compinit -u

#ls
if [ $(echo $OSTYPE | cut -b 1-6) = "darwin" ];then
	alias ls="ls -aG"
else
	alias ls="ls -a --color"
fi
export LSCOLORS=GxfxcxdxBxegedabadAeAg

#other env
export EDITOR=emacs
export HOSTNAME=`hostname`
export LANG="ja_JP.UTF-8"
export TZ=JST-9
export PATH=/usr/local/bin:$HOME/bin:$PATH


# Attache tmux
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
    if ( tmux has-session ); then
		session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
		if [ -n "$session" ]; then
			echo "Attache tmux session $session."
			tmux attach-session -t `echo $session | cut -d":" -f 1`
		else
			echo "Session has been already attached."
			tmux list-sessions
		fi
    else
		echo "Create new tmux session."
		tmux
    fi
fi

#plenv
if [ -x "$HOME/.plenv" ]; then
    export PATH=$HOME/.plenv/bin:$PATH
    eval "$(plenv init -)"
fi

#rbenv
if [ -x "$HOME/.rbenv" ]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

#pyenv
if [ -x "$HOME/.pyenv" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

#nodebrew
if [ -x "$HOME/.nodebrew" ]; then
    PATH=$HOME/.nodebrew/current/bin:$PATH
fi

if [ -x "$HOME/Documents" ]; then
	cd ~/Documents
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### direnv
eval "$(direnv hook zsh)"

export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH"

#THEOS
export THEOS="/opt/theos"

#Macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH
