# the prompt itself
PROMPT="%F{000}%(?.%K{148}.%K{red}) %(?.⌂.✘) %F{249}%K{236} %1~ %k%f "
unset RPROMPT

# handle ctrl-a and ctrl-e
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# make it easier to remove words with ctrl-w
export WORDCHARS='*?[]~&;!$%^<>'

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

# list colorful directories first if possible
if command -v gls > /dev/null; then
  alias ls='gls --color=tty --group-directories-first'
fi

# install fzf
if command -v git > /dev/null && [[ ! -d $HOME/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf 2> /dev/null
fi

if [[ -d $HOME/.fzf ]]; then
  # setup fzf
  if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
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
