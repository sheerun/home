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
