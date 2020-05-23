# the prompt itself
PROMPT="%F{000}%(?.%K{148}.%K{red}) %(?.⌂.✘) %F{249}%K{236} %1~ %k%f "
unset RPROMPT

# handle ctrl-a and ctrl-e
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

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
