# ⌂ home

> Pretty, minimalistic, one-line ZSH prompt you'll enjoy

## Installation

If you wish to install just prompt, paste this line in your `~/.zshrc`:


```zsh
PROMPT="%F{000}%(?.%K{148}.%K{red}) %(?.⌂.✘) %F{249}%K{236} %1~ %k%f "
```

If you'd like all features described below, add this repository with any zsh package manger:

```zsh
# for zplug
zplug sheerun/home

# for antigen
antigen bundle sheerun/home

# for antibody
antibody bundle sheerun/home

# for zinit
zinit load sheerun/home
```

## Features

- Shows green ⌂ by default or red ✘ if previous command failed
- Shows current directory name (type `pwd` for full path)
- Ctrl-a goes to the start of command, Ctrl-e to the end (like in other inputs)
- You can type git commands without `git` (for example `log` for `git log` or `merge` for `git merge`)

## Anti-features

- Nothing for the right side of prompt (no mess when copying commands and their output)
- Doesn't show any git information in prompt (type `st` for git status)

## License

MIT
