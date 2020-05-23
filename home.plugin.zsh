# the prompt itself
PROMPT="%F{000}%(?.%K{148}.%K{red}) %(?.⌂.✘) %F{249}%K{236} %1~ %k%f "
unset RPROMPT

# handle ctrl-a and ctrl-e
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# make it easier to remove words with ctrl-w
export WORDCHARS='*?[]~&;!$%^<>'

# set shell language to english by default
export LANG="en_US.UTF-8"

# git aliases
alias st='git st'
alias add='git add'
alias log='git log'
alias push='git push'
alias pull='git pull --tags'
alias stash='git stash'
alias clone='git clone'
alias fetch='git fetch'
alias merge='git merge -s recursive -X patience'
alias branch='git branch'
alias rebase='git rebase'

# extra git aliases
alias st='git status'
alias ci='git commit'
alias co='git checkout'
alias br='git branch'
alias dc='git diff --cached'
alias amend='git commit -C HEAD --amend'

# support aliases when using sudo
alias sudo='sudo '

# ctrl-z can take you back to process
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# make autocompletion faster by caching and prefix-only matching
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.zsh/cache

# fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# get better autocompletion accuracy by typing longer words
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# allow one error for every three characters typed
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==34=34}:${(s.:.)LS_COLORS}")';
zstyle ':completion:*' squeeze-slashes true

# better filter select
zstyle ':filter-select:highlight' matched fg=red
zstyle ':filter-select' max-lines 10
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

# list colorful directories first if possible
if command -v gls > /dev/null; then
  alias ls='gls --color=tty --group-directories-first'
fi

# install fzf
if command -v git > /dev/null && [[ ! -d $HOME/.fzf ]]; then
  echo "Downloading fzf..."
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf 2> /dev/null
fi

# save history in ~/.zsh_history
export HISTFILE=$HOME/.zsh_history

# increase history size
export SAVEHIST=100000
export HISTSIZE=100000

# save lines in history file as soon as they appear instead of on exit
setopt share_history

if [[ -d $HOME/.fzf ]]; then
  # setup fzf
  if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
    echo "Installing fzf..."
    export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
  fi

  if ! command -v fzf > /dev/null; then
    $HOME/.fzf/install --no-key-bindings --no-completion --no-update-rc --no-bash --no-fish --no-zsh &> /dev/null
  fi

  # setup fzf autocompletion
  [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

  # setup fzf bindings
  source "$HOME/.fzf/shell/key-bindings.zsh"
fi

clear
