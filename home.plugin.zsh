# define theme colors
typeset -AHg FG BG
for color in 000 148 249 236; do
  FG[$color]="%{[38;5;${color}m%}"
  BG[$color]="%{[48;5;${color}m%}"
done
PROMPT="${FG[000]}%(?.${BG[148]}.%K{red}) %(?.⌂.✘) ${FG[249]}${BG[236]} %1~ %k%f "

alias st='git st'
