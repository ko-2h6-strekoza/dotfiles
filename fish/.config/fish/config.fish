if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

export PATH="$PATH:/opt/nvim/bin"
export PATH="$HOME/.local/bin:$PATH"

# zoxide (smarter cd)
zoxide init fish | source

# cd > eza
function cd
  builtin cd $argv
    eza -la --group-directories-first --icons
end

# ls
alias l="eza -l --group-directories-first --icons"
alias ll="eza -la --group-directories-first --icons"

# for windows explorer
alias open="explorer.exe"
alias e="explorer.exe ."

# neovim
alias vi="nvim"
alias vim="nvim"

alias cdc="cd /mnt/c"
alias cdh="cd /mnt/c/Users/strekoza"
