# the prompt itself
PROMPT="%F{000}%(?.%K{148}.%K{red}) %(?.⌂.✘) %F{249}%K{236} %1~ %k%f "
unset RPROMPT

# handle ctrl-a and ctrl-e
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# git aliases
alias st='git st'
