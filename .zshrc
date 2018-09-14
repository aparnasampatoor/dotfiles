# Locale (https://help.ubuntu.com/community/Locale#List_current_settings)
export LANG="en_US.UTF-8"

# Report 256-color terminal
export TERM="xterm-256color"

# https://unix.stackexchange.com/questions/111718/command-history-in-zsh
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# antigen (https://github.com/zsh-users/antigen)
if [[ -z "$ANTIGEN_HOME" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning export ANTIGEN_HOME=/usr/local/share/antigen ..."
    export ANTIGEN_HOME="/usr/local/share/antigen"
fi

if [[ -e "$ANTIGEN_HOME/antigen.zsh" ]]; then
    [[ "$XTRACE" == "verbose" ]] && printf "\nRunning source \$ANTIGEN_HOME/antigen.zsh ..."
    source "$ANTIGEN_HOME/antigen.zsh"

    antigen use oh-my-zsh # http://ohmyz.sh

    if [[ $OSTYPE == *darwin* ]]; then
        antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/osx
    fi

    antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/git
    antigen bundle https://github.com/robbyrussell/oh-my-zsh plugins/command-not-found
    antigen bundle https://github.com/zsh-users/zsh-syntax-highlighting zsh-syntax-highlighting.plugin.zsh
    antigen bundle https://github.com/tysonwolker/iterm-tab-colors zsh-tab-colors.plugin.zsh
    antigen bundle https://github.com/rupa/z z.sh

    # https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-4-install-for-antigen
    DEFAULT_USER=$USER
    POWERLEVEL9K_MODE='nerdfont-complete'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status context dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv node_version time)
    antigen theme https://github.com/bhilburn/powerlevel9k powerlevel9k.zsh-theme

    antigen apply
fi
